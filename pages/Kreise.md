[Zurück](Re-Use.md)

---

# Dritte Aufgabe

Passe `Kreise.elm` so an, dass von den 10 konzentrischen Kreisen die inneren fünf rot, die äußeren fünf grün sind:

```elm
pic i =
  circle (10 * i)

scene _ _ =
  group
  [ pic 1
  , pic 2
  , pic 3
  , pic 4
  , pic 5
  , pic 6
  , pic 7
  , pic 8
  , pic 9
  , pic 10
  ]

main = display (-200,-150) (200,150) scene Nothing
```

Hinweise:

* Von den Funktionen `rectangle`, `square`, `circle`, `oval`, `path` gibt es Varianten, die uns das Aussehen der gezeichneten Linien verändern lassen.
  Während zum Beispiel `rectangle' (solid black) (30,20)` äquivalent zum schon gesehenen `rectangle (30,20)` ist, geht auch `rectangle' (dashed red) (30,20)`:  
  ![rectangle'](../images/rectangle'.png)  
  oder auch etwa `oval' (dotted blue) (30,20)`:  
  ![oval'](../images/oval'.png)  
  Vordefinierte Farben sind: `black`, `white`, `red`, `green`, `blue`, `yellow`, `orange`, `purple`, `brown`.
  
  (Bei Bedarf: Möglichkeiten zur Erzeugung weiterer Farben ergeben sich durch Hinzufügen von `import Color` am Anfang des Programms und Verwendung von zum Beispiel `Color.rgb 10 10 10`, siehe [hier](http://package.elm-lang.org/packages/elm-lang/core/latest/Color).)

* Um abhängig von irgendeiner Bedingung verschiedene Ergebnisse (zum Beispiel einer Funktion wie `pic i = ...`) zu liefern, lässt sich `if ... then ... else ...` verwenden.

Zielbild:

![Farbige Kreise](../images/Kreise.png)

---

[Weiter](Maus.md)

---

([Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task03/Kreise.elm), [@share-elm](http://share-elm.com/sprout/55896f3fe4b06aacf0e8a75c/0.14/view))

