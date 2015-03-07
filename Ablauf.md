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

[Drei Häuser des Nikolaus](pages/Reuse.md)

Erklärungen:

* Benennung von Ausdrücken (für Wiederverwendung)
* Zusammenfassen von Bildern in einzelnes Bild (um etwa als Eingabe für `move` zu dienen):

  ```elm
  group : List Form -> Form
  ```

# Dritte Aufgabe

[Inkreis](pages/Inkreis.md)

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

* Erst hinterher, Erwähnung von `scale : Float -> Form -> Form`, und bei der Gelegenheit auch von `rotate : Float -> Form -> Form`.

# Vierte Aufgabe

[Farbige Kreise](pages/Kreise.md)  

Erklärung dabei: `if - then - else -`

# Fünfte Aufgabe

[Reagieren auf Mausbewegungen](pages/Maus.md)  

Erklärung dabei: Ausdruck der Abhängigkeit von Mauskoordinaten

# Sechste Aufgabe

[Zeitabhängiges Verhalten](Bouncing.md)  

Erklärungen dabei:

* Ausdruck der Abhängigkeit von Zeitparameter

* `Just (Every 20)`, `Just (FPS 50)`, ...

# Weitere Aufgaben

* ...

# Bewusst ignorierte Dinge

* (vielleicht beiläufig erwähnen:) `filled`, `textured`, `gradient`
* `polygon`, `ngon`, `alpha`
* Text alignments and styles
* Styling and inspection of `Element`s (`width`, `height`, `size`, `color`, `opacity`, `widthOf`, `heightOf`, `sizeOf`)
* `Element` stuff: `container`, `spacer`, `empty`, `flow`, `layers`, `above`, ...
* `link`, `tag`
* `croppedImage`, `fittedImage`, `tiledImage`

