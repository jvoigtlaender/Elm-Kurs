import Set
import Array
import Text
import Time
import Mouse
import Keyboard
import Graphics.Collage
import Graphics.Element
import Graphics.Input
import Html
import Color
import Signal exposing ((<~), sampleOn, constant, foldp, map, map2, merge)

---------------------------------
-- write program here













---------------------------------
-- ignore everything below here


gridsize = 20

makeGrid x1 y1 x2 y2 =
  let
    x_ = (x1 + x2) / 2
    xh = x_ - x1
    y_ = (y1 + y2) / 2
    yh = y_ - y1
  in
   group
   [ group <|
     List.map (\i -> let x = toFloat i * gridsize - x_ in path' (dotted (Color.greyscale 0.15)) [ (x,-yh), (x,yh) ])
              [ ceiling (x1/gridsize) .. floor (x2/gridsize) ]
   , group <|
     List.map (\j -> let y = toFloat j * gridsize - y_ in path' (dotted (Color.greyscale 0.15)) [ (-xh,y), (xh,y) ])
              [ ceiling (y1/gridsize) .. floor (y2/gridsize) ]
   , move (-x_,-y_) (Graphics.Collage.filled red (Graphics.Collage.circle 2))
   ]

type Timing = Every Float | FPS Float | AnimationFrame

display' : (Int,Int) -> (Int,Int) -> ((Float,Float) -> Float -> Picture) -> Maybe Timing -> Signal Graphics.Element.Element
display' p1 p2 f =
  displayWithState' p1 p2 (\p t _ -> f p t) () (\_ _ _ -> identity)

displayWithState' : (Int,Int) -> (Int,Int) -> ((Float,Float) -> Float -> a -> Picture) -> a -> (Event -> (Float,Float) -> Float -> a -> a) -> Maybe Timing -> Signal Graphics.Element.Element
displayWithState' (x1,y1) (x2,y2) f =
  let
    x2_ = max (x1 + 1) x2
    y2_ = max (y1 + 1) y2
    d = (toFloat (-x1 - x2_) / 2, toFloat (-y1 - y2_) / 2) 
  in
   toScreen x1 y2_ (\_ p t s -> Graphics.Collage.collage (x2_ - x1) (y2_ - y1) [ move d (f p t s) ]) []

display : (Int,Int) -> (Int,Int) -> ((Float,Float) -> Float -> Picture) -> Maybe Timing -> Signal Graphics.Element.Element
display p1 p2 f mt =
  elaborateDisplay (Maybe.map (always "Zeit auf Null") mt) p1 p2 (\p t _ -> f p t) () (\_ _ _ -> identity) mt

displayWithState : (Int,Int) -> (Int,Int) -> ((Float,Float) -> Float -> a -> Picture) -> a -> (Event -> (Float,Float) -> Float -> a -> a) -> Maybe Timing -> Signal Graphics.Element.Element
displayWithState =
  elaborateDisplay (Just "auf Anfang")

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
           | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z

toScreen x1 y2 f extra_sigs ini upd mt =
  let
    letters = Array.fromList [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z]
  in
   Signal.map (\(t, { gridOn, mousePos, s }) -> f gridOn mousePos t s) <|
   foldp'  -- Signal.Extra.foldp'
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
           Just AnimationFrame -> Time.fps 50  -- AnimationFrame.frame
     , Signal.map
         (\ks -> case Set.toList ks of
                   [32] -> Space
                   [37] -> Left
                   [38] -> Up
                   [39] -> Right
                   [40] -> Down
                   [a]  -> Maybe.withDefault NoEvent (Array.get (a - 65) letters)
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

type alias Picture = Graphics.Collage.Form

circle : Float -> Picture
circle = circle' Graphics.Collage.defaultLine

circle' : LineStyle -> Float -> Picture
circle' s r =
  Graphics.Collage.outlined s <|
  Graphics.Collage.circle r

rectangle : (Float,Float) -> Picture
rectangle = rectangle' Graphics.Collage.defaultLine

rectangle' : LineStyle -> (Float,Float) -> Picture
rectangle' s (x,y) =
  Graphics.Collage.outlined s <|
  Graphics.Collage.rect x y

path : List (Float,Float) -> Picture
path = path' Graphics.Collage.defaultLine

path' : LineStyle -> List (Float,Float) -> Picture
path' s ps =
  Graphics.Collage.traced s <|
  Graphics.Collage.path ps

oval : (Float,Float) -> Picture
oval = oval' Graphics.Collage.defaultLine

oval' : LineStyle -> (Float,Float) -> Picture
oval' s (x,y) =
  Graphics.Collage.outlined s <|
  Graphics.Collage.oval x y

square : Float -> Picture
square = square' Graphics.Collage.defaultLine

square' : LineStyle -> Float -> Picture
square' s a =
  Graphics.Collage.outlined s <|
  Graphics.Collage.square a

type alias Color = Color.Color

ngon : Float -> Float -> Picture
ngon = ngon' black

ngon' : Color -> Float -> Float -> Picture
ngon' c n r =
  Graphics.Collage.rotate (pi/2) <|
  Graphics.Collage.filled c <|
  Graphics.Collage.ngon (floor n) r

polygon : List (Float,Float) -> Picture
polygon = polygon' Graphics.Collage.defaultLine

polygon' : LineStyle -> List (Float,Float) -> Picture
polygon' s ps =
  Graphics.Collage.outlined s <|
  Graphics.Collage.polygon ps

text : String -> Picture
text s =
  Graphics.Collage.text <|
  Text.fromString s

move : (Float,Float) -> Picture -> Picture
move = Graphics.Collage.move

group : List Picture -> Picture
group = Graphics.Collage.group

scale : Float -> Picture -> Picture
scale x f =
  Graphics.Collage.scale x <|
  group [ f ]

rotate : Float -> Picture -> Picture
rotate a f =
  Graphics.Collage.rotate a <|
  group [ f ]

{-
alpha : Float -> Picture -> Picture
alpha = Graphics.Collage.alpha
-}

type alias LineStyle = Graphics.Collage.LineStyle

solid : Color -> LineStyle
solid = Graphics.Collage.solid

dashed : Color -> LineStyle
dashed = Graphics.Collage.dashed

dotted : Color -> LineStyle
dotted = Graphics.Collage.dotted

red : Color
red = Color.red

orange : Color
orange = Color.orange

yellow : Color
yellow = Color.yellow

green : Color
green = Color.green

blue : Color
blue = Color.blue

purple : Color
purple = Color.purple

brown : Color
brown = Color.brown

white : Color
white = Color.white

black : Color
black = Color.black

image : (Float,Float) -> String -> Picture
image (x,y) s =
  Graphics.Collage.toForm <|
  Graphics.Element.image (round x) (round y) s

empty : Picture
empty = Graphics.Collage.toForm Graphics.Element.empty

icon : Float -> (Color -> Int -> Html.Html) -> Picture
icon = icon' black

icon' : Color -> Float -> (Color -> Int -> Html.Html) -> Picture
icon' c s i =
  let s' = round s
  in
   Graphics.Collage.toForm <|
   Html.toElement s' s' <|
   i c s'

---------------------------------
-- auxiliary, from Signal.Extra

(~>) : Signal a -> (a -> b) -> Signal b
(~>) =
  flip map

infixl 4 ~>

initSignal : Signal a -> Signal a
initSignal s =
  sampleOn (constant ()) s

zip : Signal a -> Signal b -> Signal (a,b)
zip =
  map2 (,)

foldp' : (a -> b -> b) -> (a -> b) -> Signal a -> Signal b
foldp' fun initFun input =
  let -- initial has no events, only the initial value is used
    initial = initSignal input ~> initFun
    -- both the initial value and the normal input are given to fun'
    rest = foldp fun' Nothing (zip input initial)
    -- when mb is Nothing, input had its first event to use ini
    -- otherwise use the b from Just
    fun' (inp, ini) mb =
      Maybe.withDefault ini mb
      |> fun inp |> Just
    
    fromJust (Just a) = a
  in
    fromJust <~ merge (Just <~ initial) rest
