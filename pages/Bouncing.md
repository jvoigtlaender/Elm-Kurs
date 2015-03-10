[Zurück](Maus.md)

---

# Sechste Aufgabe

Verändere folgendes Programm:

```elm
scene _ t =
  let
    h = t / 2
  in
    group
    [ path [ (-200,-20), (200,-20) ]
    , move (0, 100 * h) (circle 20)
    ]

main = display scene (Just (Every 0.02))
```

so dass ein auf und ab springender Ball zu sehen ist, wie etwa [hier](http://jvoigtlaender.github.io/Elm-Kurs/examples/Bouncing.html).

[share-elm](http://share-elm.com/sprout/54fcba28e4b0d720e25d602f)

Das `Just (Every 0.02)` (statt vorher `Nothing`) steht dafür, dass alle 0.02 Sekunden ein neues Bild (mit aktuellem Zeitparameter `t`, ebenfalls in Sekunden angegeben) gezeichnet werden soll.
Alternativ ist auch die Angabe einer Frames-per-Sekunde-Rate möglich, etwa mit: `Just (FPS 50)`.

---

[Weiter](Kreativ.md)

