module Lib where

import Text
import Time
import List (..)
import Color (..)
import Mouse
import Signal
import Graphics.Collage
import Graphics.Element
import Graphics.Input

dimensions = (400,300)

---------------------

gridsize = 20

grid =
  let
    (x,y) = dimensions
    xh = x/2
    yh = y/2
    i = floor(xh/gridsize)
    j = floor(yh/gridsize)
  in
   map (\i -> let x = toFloat i * gridsize in path' (dotted (greyscale 0.15)) [ (x,-yh), (x,yh) ]) [ -i .. i ]
   ++
   map (\j -> let y = toFloat j * gridsize in path' (dotted (greyscale 0.15)) [ (-xh,y), (xh,y) ]) [ -j .. j ]
   ++
   [Graphics.Collage.filled red (Graphics.Collage.circle 2)]

type Timing = Every Float | FPS Float

show : ((Float,Float) -> Float -> Form) -> Maybe Timing -> Signal Graphics.Element.Element
show f mt =
  let (x,y) = dimensions
      (timer, timerButt) = case mt of
        Nothing -> (Signal.constant 0, [])
        Just ti -> (Signal.map2 (\(a,_) (b,_) -> a - b)
                    (Time.timestamp <| case ti of
                        {Every x -> Time.every (if x < 17 then 17 else x);
                         FPS x -> Time.fps (if x > 60 then 60 else x)})
                    (Time.timestamp (Signal.subscribe buttonCh))
                   , [ Graphics.Element.spacer 10 10, Graphics.Input.button (Signal.send buttonCh ()) "Zeit auf Null" ] )
      fun (px,py) t g =
        let p = (toFloat px - x/2, y/2 - toFloat py)
        in
         Graphics.Element.flow Graphics.Element.up
         [ Graphics.Element.flow Graphics.Element.left <| Text.asText p :: gridCheck :: timerButt
         , Graphics.Element.color (greyscale 0.05) <|
           Graphics.Element.container x y Graphics.Element.middle <|
           Graphics.Collage.collage x y
           ((if g then grid else []) ++ [f p (if t < 0 then 0 else t)]) ]
  in
   Signal.map3 fun Mouse.position timer (Signal.subscribe gridChan)

buttonCh = Signal.channel ()

gridChan = Signal.channel False

gridCheck = Graphics.Input.checkbox (Signal.send gridChan) False

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

ngon : Int -> Float -> Form
ngon = ngon' Graphics.Collage.defaultLine

ngon' : LineStyle -> Int -> Float -> Form
ngon' s n r =
  Graphics.Collage.outlined s <|
  Graphics.Collage.ngon n r

polygon : List (Float,Float) -> Form
polygon = polygon' Graphics.Collage.defaultLine

polygon' : LineStyle -> List (Float,Float) -> Form
polygon' s ps =
  Graphics.Collage.outlined s <|
  Graphics.Collage.polygon ps

text : String -> Form
text s =
  Graphics.Collage.toForm <| Text.plainText s

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
image (x,y) s = Graphics.Collage.toForm (Graphics.Element.image (round x) (round y) s)

empty : Form
empty = Graphics.Collage.toForm Graphics.Element.empty

