[Zurück](Pendulum.md)

---

# Sechste Aufgabe

Verändere folgendes Programm (`Bouncing.elm`):

```elm
scene _ t =
  let
    h = 50 * t
  in
    group
    [ path [ (-200,-20), (200,-20) ]
    , circle 20 |> move (0,h)
    ]

main = display (-200,-100) (200,200) scene (Just (FPS 50))
```

so dass ein auf und ab springender Ball zu sehen ist, wie etwa [hier](http://jvoigtlaender.github.io/Elm-Kurs/examples/Bouncing.html).

<!--
[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task06/Bouncing.elm), [@share-elm](http://share-elm.com/sprout/553a87d4e4b06aacf0e8983e/0.15/view)
-->

Zusatz: Erweitere das Programm so, dass zur "Springbewegung" auch noch eine horizontale Bewegung kommt, indem der Ball der Position des Mauszeigers nach links bzw. rechts folgt.

---

[Weiter](Kreativ.md)

