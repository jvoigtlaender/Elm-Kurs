import Lib exposing (..)

scene : (Float,Float) -> Float -> Picture
scene _ _ =
  sierpinski 4

sierpinski : Int -> Picture
sierpinski i = 
  if i > 0
    then
      let 
        s = sierpinski (i-1) |> scale 0.5
      in
        empty
    else
      ngon 3 120

main = display (-200,-150) (200,150) scene Nothing

