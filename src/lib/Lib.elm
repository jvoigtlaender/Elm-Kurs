module Lib where

import Text
import Time
import AnimationFrame
import Mouse
import Graphics.Collage
import Graphics.Element
import Graphics.Input
import Html
import Color

gridsize = 20

makeGrid : (Float,Float) -> List Form
makeGrid (x,y) =
  let
    xh = x/2
    yh = y/2
    i = floor(xh/gridsize)
    j = floor(yh/gridsize)
  in
   List.map (\i -> let x = toFloat i * gridsize in path' (dotted (Color.greyscale 0.15)) [ (x,-yh), (x,yh) ]) [ -i .. i ]
   ++
   List.map (\j -> let y = toFloat j * gridsize in path' (dotted (Color.greyscale 0.15)) [ (-xh,y), (xh,y) ]) [ -j .. j ]
   ++
   [Graphics.Collage.filled Color.red (Graphics.Collage.circle 2)]

type Timing = Every Float | FPS Float | AnimationFrame

display' : (Int,Int) -> ((Float,Float) -> Float -> Form) -> Maybe Timing -> Signal Graphics.Element.Element
display' (x,y) f mt =
  let tr = case mt of
             Nothing -> Signal.constant 0
             Just ti -> makeTimer ti
      fun p t = Graphics.Collage.collage x y [f p t]
  in
   toScreen (toFloat x, toFloat y) (Signal.constant fun) tr (Signal.constant ())

display : (Int,Int) -> ((Float,Float) -> Float -> Form) -> Maybe Timing -> Signal Graphics.Element.Element
display (x,y) f mt =
  let x' = toFloat x
      y' = toFloat y
      grid = group (makeGrid (x',y'))
      buttonMbx = Signal.mailbox ()
      gridMbx = Signal.mailbox False
      gridCheck = Graphics.Input.checkbox (Signal.message gridMbx.address) False
      (tr, timerButt) = case mt of
                          Nothing -> ( Signal.constant 0, [])
                          Just ti -> ( makeTimer ti
                                     , [ Graphics.Element.spacer 10 10, Graphics.Input.button (Signal.message buttonMbx.address ()) "Zeit auf Null" ] )
      fun g p t =
         Graphics.Element.flow Graphics.Element.up
         [ Graphics.Element.flow Graphics.Element.left <| Graphics.Element.show p :: gridCheck :: timerButt
         , Graphics.Element.color (Color.greyscale 0.05) <|
           Graphics.Element.container x y Graphics.Element.middle <|
           Graphics.Collage.collage x y
           ((if g then [ grid ] else []) ++ [f p t]) ]
  in
   toScreen (x',y') (Signal.map fun gridMbx.signal) tr buttonMbx.signal

makeTimer ti =
  case ti of
    Every f -> Time.every (if f < 0.017 then 17 else 1000 * f)
    FPS f -> Time.fps (if f > 60 then 60 else f)
    AnimationFrame -> AnimationFrame.frame

toScreen : (Float,Float) -> Signal ((Float,Float) -> Float -> Graphics.Element.Element) -> Signal a -> Signal b -> Signal Graphics.Element.Element
toScreen (x',y') funs tr tx =
  let
    xh = x'/2
    yh = y'/2
    timer =
      Signal.map2 (\(a,_) (b,_) -> if a > b then (a - b) / 1000 else 0)
      (Time.timestamp tr)
      (Time.timestamp tx)
  in
   Signal.map3 (\f (px,py) -> f (toFloat px - xh, yh - toFloat py)) funs Mouse.position timer

type alias Form = Graphics.Collage.Form

circle : Float -> Form
circle = circle' Graphics.Collage.defaultLine

circle' : LineStyle -> Float -> Form
circle' s r =
  Graphics.Collage.outlined s <|
  Graphics.Collage.circle r

rectangle : (Float,Float) -> Form
rectangle = rectangle' Graphics.Collage.defaultLine

rectangle' : LineStyle -> (Float,Float) -> Form
rectangle' s (x,y) =
  Graphics.Collage.outlined s <|
  Graphics.Collage.rect x y

path : List (Float,Float) -> Form
path = path' Graphics.Collage.defaultLine

path' : LineStyle -> List (Float,Float) -> Form
path' s ps =
  Graphics.Collage.traced s <|
  Graphics.Collage.path ps

oval : (Float,Float) -> Form
oval = oval' Graphics.Collage.defaultLine

oval' : LineStyle -> (Float,Float) -> Form
oval' s (x,y) =
  Graphics.Collage.outlined s <|
  Graphics.Collage.oval x y

square : Float -> Form
square = square' Graphics.Collage.defaultLine

square' : LineStyle -> Float -> Form
square' s a =
  Graphics.Collage.outlined s <|
  Graphics.Collage.square a

type alias Color = Color.Color

ngon : Float -> Float -> Form
ngon = ngon' Color.black

ngon' : Color -> Float -> Float -> Form
ngon' c n r =
  rotate (pi/2) <|
  Graphics.Collage.filled c <|
  Graphics.Collage.ngon (floor n) r

polygon : List (Float,Float) -> Form
polygon = polygon' Graphics.Collage.defaultLine

polygon' : LineStyle -> List (Float,Float) -> Form
polygon' s ps =
  Graphics.Collage.outlined s <|
  Graphics.Collage.polygon ps

text : String -> Form
text s =
  Graphics.Collage.text <|
  Text.fromString s

move : (Float,Float) -> Form -> Form
move = Graphics.Collage.move

group : List Form -> Form
group = Graphics.Collage.group

scale : Float -> Form -> Form
scale = Graphics.Collage.scale

rotate : Float -> Form -> Form
rotate = Graphics.Collage.rotate

alpha : Float -> Form -> Form
alpha = Graphics.Collage.alpha

type alias LineStyle = Graphics.Collage.LineStyle

solid : Color -> LineStyle
solid = Graphics.Collage.solid

dashed : Color -> LineStyle
dashed = Graphics.Collage.dashed

dotted : Color -> LineStyle
dotted = Graphics.Collage.dotted

image : (Float,Float) -> String -> Form
image (x,y) s =
  Graphics.Collage.toForm <|
  Graphics.Element.image (round x) (round y) s

empty : Form
empty = Graphics.Collage.toForm Graphics.Element.empty

icon : Float -> (Color -> Int -> Html.Html) -> Form
icon = icon' Color.black

icon' : Color -> Float -> (Color -> Int -> Html.Html) -> Form
icon' c s i =
  let s' = round s
  in
   Graphics.Collage.toForm <|
   Html.toElement s' s' <|
   i c s'
