import Lib exposing (..)
import Color exposing (..)

pic i =
  circle (10 * i)

scene _ _ =
  group
  [ pic 1
  , pic 2
  , pic 3
  , pic 4
  , pic 5
  , pic 6
  , pic 7
  , pic 8
  , pic 9
  , pic 10
  ]

main = display (-200,-150) (200,150) scene Nothing

