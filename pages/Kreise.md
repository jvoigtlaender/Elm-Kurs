[Zurück](Re-Use.md)

---

# Dritte Aufgabe

Passe `Kreise.elm` so an, dass von den 10 konzentrischen Kreisen die inneren fünf rot, die äußeren fünf grün sind:

```elm
import Color exposing (..)

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

<!--
[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/Kreise.elm), [@share-elm](http://share-elm.com/sprout/553a89b8e4b06aacf0e89847/0.15/view)
-->

Hinweise:

* Von den Funktionen `rectangle`, `square`, `circle`, `oval`, `path` gibt es Varianten, die uns das Aussehen der gezeichneten Linien verändern lassen.
  Während zum Beispiel `rectangle' (solid black) (30,20)` äquivalent zum schon gesehenen `rectangle (30,20)` ist, geht auch `rectangle' (dashed red) (30,20)`:  
  ![rectangle'](../images/rectangle'.png)  
  oder auch etwa `oval' (dotted blue) (30,20)`:  
  ![oval'](../images/oval'.png)  
  Eine Übersicht vorhandener Farben und Möglichkeiten zur Erzeugung neuer findet man bei Bedarf [hier](http://package.elm-lang.org/packages/elm-lang/core/latest/Color).

* Um abhängig von irgendeiner Bedingung verschiedene Ergebnisse (zum Beispiel einer Funktion wie `pic i = ...`) zu liefern, lässt sich `if ... then ... else ...` verwenden.

Zielbild:

![Farbige Kreise](../images/Kreise.png)

---

[Weiter](Maus.md)

