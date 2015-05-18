import Lib exposing (..)

initial = 0

update event _ _ state =
  case event of
    Space -> state + 1
    _     -> state

scene _ _ state =
  group
  [ text (toString state) ]

main = displayWithState (-200,-150) (200,150) scene initial update Nothing

