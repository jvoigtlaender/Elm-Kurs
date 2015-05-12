import Lib exposing (..)

form i =
  circle (10 * i)

scene _ _ =
  group
  [ form 1
  , form 2
  , form 3
  , form 4
  , form 5
  , form 6
  , form 7
  , form 8
  , form 9
  , form 10
  ]

main = display (400,300) scene Nothing

