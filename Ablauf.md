# Erste Aufgabe

[Haus des Nikolaus](Nikolaus.md)

Dann Erklärungen zu:

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

Mache aus dem einen Haus des Nikolaus drei nebeneinander stehende Häuser des Nikolaus.

Erklärungen:

* Benennung von Ausdrücken (für Wiederverwendung)
* Zusammenfassen von Bildern in einzelnes Bild (um etwa als Eingabe für `move` zu dienen):

  ```elm
  group : List Form -> Form
  ```

# Weitere Aufgaben

* Male ein gleichseitiges, grünes Dreieck mit einbeschriebenem, rot gestricheltem Inkreis, so dass dieser den Radius 25 hat.  
  Erklärungen:
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
* Schreibe und verwende eine Funktion (zu erklären), welche die vorige Aufgabe nicht nur für Radius 25 löst.

