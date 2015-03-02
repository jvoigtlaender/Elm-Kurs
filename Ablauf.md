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

*
```elm
group : List Form -> Form
```
