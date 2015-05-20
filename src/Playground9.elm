import Lib exposing (..)

type alias State = (Float,Float)

initial : State
initial = (0,0)

update : Event -> (Float,Float) -> Float -> State -> State
update event _ _ (x,y) =
  case event of
    _     -> (x,y)

scene : (Float,Float) -> Float -> State -> Picture
scene _ _ (x,y) =
  image (45,45) "http://elm-lang.org/imgs/mario/stand/right.gif" |> move (x,y)

main = displayWithState (-200,-150) (200,150) scene initial update Nothing

