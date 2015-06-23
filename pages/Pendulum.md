[Zurück](Maus.md)

---

# Fünfte Aufgabe

Verändere folgendes Programm (`Pendulum.elm`):

```elm
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

main = display (-200,-200) (200,100) scene (Just (Every 0.02))
```

so dass das Pendel eine realistische Bewegung ausführt, wie etwa [hier](http://jvoigtlaender.github.io/Elm-Kurs/examples/Pendulum.html).

Das `Just (Every 0.02)` (statt vorher `Nothing`) steht dafür, dass alle 0.02 Sekunden ein neues Bild (mit aktuellem Zeitparameter `t`, ebenfalls in Sekunden angegeben) gezeichnet werden soll.
Alternativ ist auch die Angabe einer Frames-per-Sekunde-Rate möglich, etwa mit: `Just (FPS 50)`.
Außerdem kann man die Entscheidung auch einfach an den Browser delegieren, also sich an dessen Frame-Rate koppeln, mittels: `Just AnimationFrame`.

---

[Weiter](Bouncing.md)

---

([Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task05/Pendulum.elm), [@share-elm](http://share-elm.com/sprout/55897011e4b06aacf0e8a75e/0.14/view))

