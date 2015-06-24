import Lib exposing (..)

scene : (Float,Float) -> Float -> Picture
scene _ _  =
  group
  [ empty ]

main = display (-200,-150) (200,150) scene Nothing

