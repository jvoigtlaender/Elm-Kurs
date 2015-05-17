import Lib exposing (..)

scene _ t =
  let
    h = 50 * t
  in
    group
    [ path [ (-200,-20), (200,-20) ]
    , circle 20 |> move (0,h)
    ]

main = display (-200,-100) (200,200) scene (Just (FPS 50))

