[Zurück](Nikolaus.md)

---

# Zum Zeichnen geometrischer Formen

Wir haben schon einige Ausdrucksmöglichkeiten gesehen.
Ein allgemeinerer Überblick mit Beispielen:

* `rectangle (30,20)`  
  Führt zu:  
  ![rectangle](../images/rectangle.png)

* `square 20`  
  Führt zu:  
  ![square](../images/square.png)

* `circle 10`  
  Führt zu:  
  ![circle](../images/circle.png)

* `oval (30,20)`  
  Führt zu:  
  ![oval](../images/oval.png)

* `path [ (0,0), (15,15), (30,-15), (40,5) ]`  
  Führt zu:  
  ![path](../images/path.png)

* `text "Hallo"`  
  Führt zu:  
  ![text](../images/text.png)

Da außer bei (absolut positioniertem) `path` die Formen zunächst immer um den Koordinatenursprung `(0,0)` zentriert sind, ist `move` nützlich.
Zum Beispiel:

```elm
scene _ _ =
   [ rectangle (30,20)
   , move (30,10) (circle 10)
   ]
```

Führt zu:  
![move](../images/move.png)

