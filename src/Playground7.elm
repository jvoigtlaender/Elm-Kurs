import Lib exposing (..)

list =
  [ (circle 10, 0)
  , (square 15, pi/2)
  , (circle 10, pi)
  , (square 15, 1.5*pi)
  ]

scene (x,y) t =
  let
    fun i (form, alpha) =
      let
        (a,b) = (120 * cos(alpha + t/1.5), 120 * sin(alpha + t/1.5))
        image = group [form, text (toString i)]
      in
        image |> move (a,b)
  in
    group (List.indexedMap (fun << toFloat) list)

main = display (400,300) scene (Just (FPS 50))

