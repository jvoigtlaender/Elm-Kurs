[Zurück](Pendulum.md)

---

# Sechste Aufgabe

Verändere folgendes Programm:

```elm
scene _ t =
  let
    h = 50 * t
  in
    group
    [ path [ (-200,-20), (200,-20) ]
    , circle 20 |> move (0,h)
    ]

main = display scene (Just (FPS 50))
```

so dass ein auf und ab springender Ball zu sehen ist, wie etwa [hier](http://jvoigtlaender.github.io/Elm-Kurs/examples/Bouncing.html).

[share-elm](http://share-elm.com/sprout/54fcba28e4b0d720e25d602f)

---

[Weiter](Kreativ.md)

