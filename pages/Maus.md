[Zurück](Kreise.md)

---

# Vierte Aufgabe

Vervollständige `Maus.elm` nun so, dass immer genau die Kreise rot sind, die näher am Koordinatenursprung sind als der Mauszeiger (und die anderen grün):

```elm
pic (x,y) i =
  let
    r = 10 * i
  in
    ...

scene (x,y) _ =
  group
  [ pic (x,y) 1
  , pic (x,y) 2
  , pic (x,y) 3
  , pic (x,y) 4
  , pic (x,y) 5
  , pic (x,y) 6
  , pic (x,y) 7
  , pic (x,y) 8
  , pic (x,y) 9
  , pic (x,y) 10
  ]

main = display (-200,-150) (200,150) scene Nothing
```

<!--
[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task04/Maus.elm), [@share-elm](http://share-elm.com/sprout/553a8a0ae4b06aacf0e89848/0.15/view)
-->

Zusätzlich zu den bisherigen Möglichkeiten stehen nun in `x` und `y` immer die Koordinaten der jeweils aktuellen Mausposition zur Verfügung.
Das gezeichnete Bild ist also nicht mehr statisch, sondern reagiert auf Mausbewegungen.

Zielverhalten wie hier: [Reagieren auf Mausbewegungen](http://jvoigtlaender.github.io/Elm-Kurs/examples/Kreise.html).

---

Beispielausdrücke zur Erinnerung:

* `circle' (solid green) r`
* `if ... then ... else ...`

---

[Weiter](Pendulum.md)

