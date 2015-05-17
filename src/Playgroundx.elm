import Lib exposing (..)

scene _ _ =
  group
  [ sierpinski 4 ]

sierpinski i = 
  if i > 0
    then
      let 
        s = group
            [ sierpinski (i-1) ]
            |> scale 0.5
      in
        empty
    else
      ngon 3 120

main = display (-200,-150) (200,150) scene Nothing

