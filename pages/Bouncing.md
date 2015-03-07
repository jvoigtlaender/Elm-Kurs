[Zurück](Maus.md)

---

# Sechste Aufgabe

Verändere folgendes Programm:

```elm
scene _ t =
  let
    h = t / 2000
  in
    group
    [ path [ (-200,-20), (200,-20) ]
    , move (0, 100 * h) (circle 20)
    ]

main = show scene (Just (Every 20))
```

so dass ein auf und ab springender Ball zu sehen ist, wie etwa [hier](http://jvoigtlaender.github.io/Elm-Kurs/examples/Bouncing.html).

Das `Just (Every 20)` steht dafür, dass alle 20 Millisekunden ein neues Bild (mit aktuellem Zeitparameter `t`, ebenfalls in Millisekunden angegeben) gezeichnet werden soll.
Alternativ ist auch die Angabe einer Frame-Rate möglich, etwa mit: `Just (FPS 50)`.

---

[Weiter](Kreativ.md)

