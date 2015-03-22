import Text
import Time
import List (..)
import Color (..)
import Mouse
import Signal
import Graphics.Collage
import Graphics.Element
import Graphics.Input

scene _ t =
  let
    alpha = cos(2*t) * pi/3
    a = 100 * alpha
    b = -100
  in
    group
    [ path [ (0,0), (a,b) ]
    , circle 10 |> move (a,b)
    ]
    |> move (0,50)

main = display (400,300) scene (Just (Every 0.02))















---------------------------------
-- ignore everything below here

gridsize = 20

makeGrid : (Float,Float) -> List Form
makeGrid (x,y) =
  let
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
      (tr, timerButt) = case mt of
                          Nothing -> ( Signal.constant 0, [])
                          Just ti -> ( makeTimer ti
                                     , [ Graphics.Element.spacer 10 10, Graphics.Input.button (Signal.send buttonCh ()) "Zeit auf Null" ] )
      fun g p t =
         Graphics.Element.flow Graphics.Element.up
         [ Graphics.Element.flow Graphics.Element.left <| Text.asText p :: gridCheck :: timerButt
         , Graphics.Element.color (greyscale 0.05) <|
           Graphics.Element.container x y Graphics.Element.middle <|
           Graphics.Collage.collage x y
           ((if g then [ grid ] else []) ++ [f p t]) ]
  in
   toScreen (x',y') (Signal.map fun (Signal.subscribe gridChan)) tr (Signal.subscribe buttonCh)

makeTimer ti =
  case ti of
    Every f -> Time.every (if f < 0.017 then 17 else 1000 * f)
    FPS f -> Time.fps (if f > 60 then 60 else f)

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

ngon : Float -> Float -> Form
ngon = ngon' black

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

