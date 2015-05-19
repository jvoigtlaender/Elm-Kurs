# Start

http://tinyurl.com/Elm-Kurs

# Erste Aufgabe

[Haus des Nikolaus](pages/Nikolaus.md)

Dann Erklärungen zu (neben Listensyntax):

```elm
rectangle : (Float,Float) -> Picture
square : Float -> Picture
circle : Float -> Picture
oval : (Float,Float) -> Picture
text : String -> Picture
```

Obige jeweils zentriert um Ursprung.

Anders (absolute Koordinaten) bei:

```elm
path : List (Float,Float) -> Picture
```

Für Zusatz (und bei weiteren Aufgaben) nützlich:

```elm
move : (Float,Float) -> Picture -> Picture
```

# Zweite Aufgabe

[Drei Häuser des Nikolaus](pages/Re-Use.md)

Erklärungen:

* Benennung von Ausdrücken (für Wiederverwendung)
* Eventuell Zusammenfassen von Bildern in einzelnes Bild (um etwa als Eingabe für `move` zu dienen):

  ```elm
  group : List Picture -> Picture
  ```

# Dritte Aufgabe

[Farbige Kreise](pages/Kreise.md)

Erklärungen dabei:

* Styling:

  ```elm
  rectangle' : LineStyle -> (Float,Float) -> Picture
  square' : LineStyle -> Float -> Picture
  circle' : LineStyle -> Float -> Picture
  oval' : LineStyle -> (Float,Float) -> Picture
  path' : LineStyle -> List (Float,Float) -> Picture
  
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

# Achte Aufgabe

[Zustandsverhalten](pages/Counter.md)

# Neunte Aufgabe

[Zustandsmodellierung](pages/Mario.md)

# Zusatzaufgabe

[Rekursion für das Sierpinski-Dreieck](pages/Fraktal.md)

# Weggelassene Aufgabe

[Inkreis](pages/Inkreis.md)

# Bewusst ignorierte Dinge

* (vielleicht beiläufig erwähnen:) `filled`, `textured`, `gradient`
* `polygon`, `alpha`
* Text alignments and styles
* Styling and inspection of `Element`s (`width`, `height`, `size`, `color`, `opacity`, `widthOf`, `heightOf`, `sizeOf`)
* `Element` stuff: `container`, `spacer`, `flow`, `layers`, `above`, ...
* `link`, `tag`
* `croppedImage`, `fittedImage`, `tiledImage`

