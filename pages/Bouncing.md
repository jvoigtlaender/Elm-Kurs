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

main = display (400,300) scene (Just (FPS 50))
```

so dass ein auf und ab springender Ball zu sehen ist, wie etwa [hier](http://jvoigtlaender.github.io/Elm-Kurs/riegel-campus-2015/Bouncing.html).

[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/riegel-campus-2015/task-files/Playground6.elm), [@share-elm](http://share-elm.com/sprout/550dbdf8e4b0d720e25d650a/0.14/view)

---

[Weiter](Kreativ.md)

