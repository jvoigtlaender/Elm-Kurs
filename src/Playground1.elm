import Lib exposing (..)

scene _ _ =
  group
  [ rectangle (100,130)
  , path [ (-50,-65), (50,65) ]
  ]

main = display (-200,-150) (200,150) scene Nothing

