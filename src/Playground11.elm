import Lib exposing (..)

type alias Position = (Float,Float)
type alias Velocity = (Float,Float)
type alias State = (Float, Position, Velocity)

alpha = pi/4

initial : State
initial = (0, (10 * cos(alpha), 10 * sin(alpha)), (40 * cos(alpha), 40 * sin(alpha)))

update : Event -> (Float,Float) -> Float -> State -> State
update event _ t' state =
  case (event, state) of
    (W, (t, (x,y), (vx,vy))) -> (t, (x,y), (vx - 5,vy))
    (_, (t, (x,y), (vx,vy))) ->
      let
        dt = t' - t
        x' = x
        y' = y
        vx' = vx
        vy' = vy
      in
        (t', (x',y'), (vx',vy'))

scene : (Float,Float) -> Float -> State -> Picture
scene _ _ (_, (x,y), _) =
  group
  [ rectangle (10,2) |> move (5,0) |> rotate alpha
  , circle 1 |> move (x,y)
  ]
  |> scale 3

main = displayWithState (-10,-10) (600,300) scene initial update (Just (FPS 50))

