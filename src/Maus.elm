import Lib exposing (..)

pic (x,y) i =
  let
    r = 10 * i
  in
    empty

scene (x,y) _ =
  group
  [ pic (x,y) 1
  , pic (x,y) 2
  , pic (x,y) 3
  , pic (x,y) 4
  , pic (x,y) 5
  , pic (x,y) 6
  , pic (x,y) 7
  , pic (x,y) 8
  , pic (x,y) 9
  , pic (x,y) 10
  ]

main = display (-200,-150) (200,150) scene Nothing

