import Lib exposing (..)
import Color exposing (..)

form (x,y) i =
  let
    r = 10 * i
  in
    empty

scene (x,y) _ =
  group
  [ form (x,y) 1
  , form (x,y) 2
  , form (x,y) 3
  , form (x,y) 4
  , form (x,y) 5
  , form (x,y) 6
  , form (x,y) 7
  , form (x,y) 8
  , form (x,y) 9
  , form (x,y) 10
  ]

main = display (400,300) scene Nothing

