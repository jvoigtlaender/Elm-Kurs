[Zur�ck](Nikolaus.md)

---

# Zum Zeichnen geometrischer Formen

Wir haben schon einige Ausdrucksm�glichkeiten gesehen.
Ein allgemeinerer �berblick mit Beispielen:

* `rectangle (30,20)`  
  f�hrt zu:  
  ![rectangle](../images/rectangle.png)

* `square 20`  
  f�hrt zu:  
  ![square](../images/square.png)

* `circle 10`  
  f�hrt zu:  
  ![circle](../images/circle.png)

* `oval (30,20)`  
  f�hrt zu:  
  ![oval](../images/oval.png)

* `path [ (0,0), (15,15), (30,-15), (40,5) ]`  
  f�hrt zu:  
  ![path](../images/path.png)

* `text "Hallo"`  
  f�hrt zu:  
  ![text](../images/text.png)

Da au�er bei (absolut positioniertem) `path` die Formen zun�chst immer um den Koordinatenursprung `(0,0)` zentriert sind, ist `move` oft n�tzlich.
Zum Beispiel:

```elm
scene _ _ =
  group
  [ rectangle (30,20)
  , circle 10 |> move (30,10)
  ]
```
![move](../images/move.png)

---

[Weiter](Re-Use.md)

