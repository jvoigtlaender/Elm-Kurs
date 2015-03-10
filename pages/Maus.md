[Zurück](Kreise.md)

---

# Fünfte Aufgabe

Vervollständige nun so, dass immer genau die Kreise rot sind, die näher am Koordinatenursprung sind als der Mauszeiger (und die anderen grün):

```elm
form (x,y) i =
  let
    r = 10 * i
  in
    ...

scene (x,y) _ =
  group
  [ form (x,y) 1
  , form (x,y) 2
  , form (x,y) 3
  , form (x,y) 4
  , form (x,y) 5
  , form (x,y) 6
  , form (x,y) 7
  , form (x,y) 8
  , form (x,y) 9
  , form (x,y) 10
  ]

main = show scene Nothing
```

[share-elm](http://share-elm.com/sprout/54fcb9c2e4b0d720e25d602d)

Zielverhalten wie hier: [Reagieren auf Mausbewegungen](http://jvoigtlaender.github.io/Elm-Kurs/examples/Kreise.html).

---

Beispielausdrücke zur Erinnerung:

* `circle' (solid green) r`
* `if ... then ... else ...`
* `a/sqrt(12)`

---

[Weiter](Bouncing.md)

