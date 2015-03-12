# Erste Aufgabe

[Haus des Nikolaus](pages/Nikolaus.md)

Dann Erklärungen zu (neben Listensyntax):

```elm
rectangle : (Float,Float) -> Form
square : Float -> Form
circle : Float -> Form
oval : (Float,Float) -> Form
text : String -> Form
```

Obige jeweils zentriert um Ursprung.

Anders (absolute Koordinaten) bei:

```elm
path : List (Float,Float) -> Form
```

Für Zusatz (und bei weiteren Aufgaben) nützlich:

```elm
move : (Float,Float) -> Form -> Form
```

# Zweite Aufgabe

[Drei Häuser des Nikolaus](pages/Re-Use.md)

Erklärungen:

* Benennung von Ausdrücken (für Wiederverwendung)
* Eventuell Zusammenfassen von Bildern in einzelnes Bild (um etwa als Eingabe für `move` zu dienen):

  ```elm
  group : List Form -> Form
  ```

# Dritte Aufgabe

[Farbige Kreise](pages/Kreise.md)

Erklärungen dabei:

* Styling:

  ```elm
  rectangle' : LineStyle -> (Float,Float) -> Form
  square' : LineStyle -> Float -> Form
  circle' : LineStyle -> Float -> Form
  oval' : LineStyle -> (Float,Float) -> Form
  path' : LineStyle -> List (Float,Float) -> Form
  
  solid : Color -> LineStyle
  dashed : Color -> LineStyle
  dotted : Color -> LineStyle
  ```

* arithmetische Ausdrücke

* Funktionen

* `if ... then ... else ...`

# Vierte Aufgabe

[Reagieren auf Mausbewegungen](pages/Maus.md)

Erklärung dabei: Ausdruck der Abhängigkeit von Mauskoordinaten

# Fünfte Aufgabe

[Zeitabhängiges Verhalten](pages/Pendulum.md)

Erklärung dabei: Ausdruck der Abhängigkeit von Zeitparameter

# Sechste Aufgabe

[Wieder zeitabhängiges Verhalten](pages/Bouncing.md)

# Siebte Aufgabe

[Freies Spiel der Kräfte](pages/Kreativ.md)

# Weggelassene Aufgabe

[Inkreis](pages/Inkreis.md)

# Bewusst ignorierte Dinge

* (vielleicht beiläufig erwähnen:) `filled`, `textured`, `gradient`
* `polygon`, `ngon`, `alpha`
* Text alignments and styles
* Styling and inspection of `Element`s (`width`, `height`, `size`, `color`, `opacity`, `widthOf`, `heightOf`, `sizeOf`)
* `Element` stuff: `container`, `spacer`, `flow`, `layers`, `above`, ...
* `link`, `tag`
* `croppedImage`, `fittedImage`, `tiledImage`
* `scale`, `rotate`

