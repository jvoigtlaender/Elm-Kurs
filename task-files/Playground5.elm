import Lib

scene _ t =
  let
    alpha = cos(2*t) * pi/3
    a = 100 * alpha
    b = -100
  in
    group
    [ path [ (0,0), (a,b) ]
    , circle 10 |> move (a,b)
    ]
    |> move (0,50)

main = display (400,300) scene (Just (Every 0.02))

