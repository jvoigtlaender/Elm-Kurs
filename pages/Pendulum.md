[Zurück](Maus.md)

---

# Fünfte Aufgabe

Verändere folgendes Programm:

```elm
scene _ t =
  let
    alpha = cos(2*t) * pi/3
    a = 100 * alpha
    b = -100
  in
    group
    [ path [ (0,0), (a,b) ]
    , move (a,b) (circle 10)
    ]
    |> move (0,50)

main = display (400,300) scene (Just (Every 0.02))
```

so dass das Pendel eine realistische Bewegung ausführt, wie etwa [hier](http://jvoigtlaender.github.io/Elm-Kurs/examples/Pendulum.html).

[share-elm](http://share-elm.com/sprout/5506a087e4b0d720e25d6302)

Das `Just (Every 0.02)` (statt vorher `Nothing`) steht dafür, dass alle 0.02 Sekunden ein neues Bild (mit aktuellem Zeitparameter `t`, ebenfalls in Sekunden angegeben) gezeichnet werden soll.
Alternativ ist auch die Angabe einer Frames-per-Sekunde-Rate möglich, etwa mit: `Just (FPS 50)`.

---

[Weiter](Bouncing.md)

