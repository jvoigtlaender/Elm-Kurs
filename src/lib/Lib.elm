module Lib ( Timing(..), Event(..), Form, LineStyle,
             display, displayWithState, display', displayWithState',
             circle, circle', rectangle, rectangle', square, square', path, path', oval, oval',
             ngon, ngon', polygon, polygon', text, image, icon, icon', empty,
             move, group, scale, rotate, alpha,
             solid, dashed, dotted
           ) where

import Set
import Text
import Time
import AnimationFrame
import Signal.Extra
import Mouse
import Keyboard
import Graphics.Collage
import Graphics.Element
import Graphics.Input
import Html
import Color

-- not exported
gridsize = 20

-- not exported
makeGrid x1 y1 x2 y2 =
  let
    x_ = (x1 + x2) / 2
    xh = x_ - x1
    y_ = (y1 + y2) / 2
    yh = y_ - y1
  in group <|
   List.map (\i -> let x = toFloat i * gridsize - x_ in path' (dotted (Color.greyscale 0.15)) [ (x,-yh), (x,yh) ])
            [ ceiling (x1/gridsize) .. floor (x2/gridsize) ]
   ++
   List.map (\j -> let y = toFloat j * gridsize - y_ in path' (dotted (Color.greyscale 0.15)) [ (-xh,y), (xh,y) ])
            [ ceiling (y1/gridsize) .. floor (y2/gridsize) ]
   ++
   [ move (-x_,-y_) (Graphics.Collage.filled Color.red (Graphics.Collage.circle 2))]

type Timing = Every Float | FPS Float | AnimationFrame

display' : (Int,Int) -> (Int,Int) -> ((Float,Float) -> Float -> Form) -> Maybe Timing -> Signal Graphics.Element.Element
display' p1 p2 f =
  displayWithState' p1 p2 (\p t _ -> f p t) () (\_ _ _ -> identity)

displayWithState' : (Int,Int) -> (Int,Int) -> ((Float,Float) -> Float -> a -> Form) -> a -> (Event -> (Float,Float) -> Float -> a -> a) -> Maybe Timing -> Signal Graphics.Element.Element
displayWithState' (x1,y1) (x2,y2) f =
  let
    x2_ = max (x1 + 1) x2
    y2_ = max (y1 + 1) y2
    d = (toFloat (-x1 - x2_) / 2, toFloat (-y1 - y2_) / 2) 
  in
   toScreen x1 y2_ (\_ p t s -> Graphics.Collage.collage (x2_ - x1) (y2_ - y1) [ move d (f p t s) ]) []

display : (Int,Int) -> (Int,Int) -> ((Float,Float) -> Float -> Form) -> Maybe Timing -> Signal Graphics.Element.Element
display p1 p2 f mt =
  elaborateDisplay (Maybe.map (always "Zeit auf Null") mt) p1 p2 (\p t _ -> f p t) () (\_ _ _ -> identity) mt

displayWithState : (Int,Int) -> (Int,Int) -> ((Float,Float) -> Float -> a -> Form) -> a -> (Event -> (Float,Float) -> Float -> a -> a) -> Maybe Timing -> Signal Graphics.Element.Element
displayWithState =
  elaborateDisplay (Just "auf Anfang")

-- not exported
elaborateDisplay mr (x1,y1) (x2,y2) f ini upd =
  let x2_ = max (x1 + 1) x2
      y2_ = max (y1 + 1) y2
      x1' = toFloat x1
      y1' = toFloat y1
      x2' = toFloat x2_
      y2' = toFloat y2_
      grid = makeGrid x1' y1' x2' y2'
      gridMbx = Signal.mailbox False  -- value here actually irrelevant
      gridCheck = Graphics.Input.checkbox (Signal.message gridMbx.address)
      restartMbx = Signal.mailbox ()
      restartButt = case mr of
                      Nothing -> []
                      Just msg -> [ Graphics.Element.spacer 10 10, Graphics.Input.button (Signal.message restartMbx.address ()) msg ]
      x = x2_ - x1
      y = y2_ - y1
      d = ((-x1' - x2') / 2, (-y1' - y2') / 2)
      f' g p t s =
         Graphics.Element.flow Graphics.Element.up
         [ Graphics.Element.flow Graphics.Element.left <| Graphics.Element.show p :: gridCheck g :: restartButt
         , Graphics.Element.color (Color.greyscale 0.05) <|
           Graphics.Element.container x y Graphics.Element.middle <|
           Graphics.Collage.collage x y
           ((if g then [ grid ] else []) ++ [ move d (f p t s) ]) ]
  in
   toScreen x1 y2_ f'
   [ Signal.map
       (\g _ t' state -> (t', { state | gridOn <- g, s <- upd NoEvent state.mousePos t' state.s }))
       gridMbx.signal
   , Signal.map
       (\_ t _ state -> (0, { state | lastReset <- t, s <- ini }))
       restartMbx.signal
   ]
   ini upd

type Event = Space | Left | Up | Right | Down | Click | NoEvent

-- not exported
toScreen x1 y2 f extra_sigs ini upd mt =
   Signal.map (\(t, { gridOn, mousePos, s }) -> f gridOn mousePos t s) <|
   Signal.Extra.foldp'
     (\(t, action) (_, state) -> action t ((t - state.lastReset) / 1000) state)
     (\(t, _) -> (0, { gridOn = False, mousePos = (0,0), lastReset = t, s = ini }))
   <|
   Time.timestamp <|
   Signal.mergeMany <|
   List.map (Signal.map (\event _ t' state -> (t', { state | s <- upd event state.mousePos t' state.s })))
     [ Signal.map (always NoEvent) <|
         case mt of
           Nothing             -> Signal.constant 0
           Just (Every f)      -> Time.every (if f < 0.017 then 17 else 1000 * f)
           Just (FPS f)        -> Time.fps (if f > 60 then 60 else f)
           Just AnimationFrame -> AnimationFrame.frame
     , Signal.map
         (\ks -> case Set.toList ks of
                   [32] -> Space
                   [37] -> Left
                   [38] -> Up
                   [39] -> Right
                   [40] -> Down
                   _ -> NoEvent)
         Keyboard.keysDown
     , Signal.map (always Click) Mouse.clicks
     ]
   ++
   Signal.map
       (\(x,y) _ t' state -> let pos = (toFloat (x1 + x), toFloat (y2 - y))
                             in (t', { state | mousePos <- pos, s <- upd NoEvent pos t' state.s }))
       Mouse.position
   ::
   extra_sigs

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
