import Lib exposing (..)
import Color exposing (..)

type alias State = List Picture

initial : State
initial = []

update : Event -> (Float,Float) -> Float -> State -> State
update event (x,y) _ list = list

scene : (Float,Float) -> Float -> State -> Picture
scene (x,y) _ list =
  group
  (list ++ [ ngon' red 5 15 |> move (x,y) ])

main = displayWithState (-200,-150) (200,150) scene initial update Nothing

