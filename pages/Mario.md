[Zurück](Counter.md)

---

# Neunte Aufgabe

In der Regel benötigt man zur Modellierung des potentiell veränderlichen Zustands eines Systems oder Programms mehr als eine einzelne Zahl.

Im folgenden Beispiel:

```elm
type alias State = (Float,Float)

initial : State
initial = (0,0)

update : Event -> (Float,Float) -> Float -> State -> State
update event _ _ (x,y) =
  case event of
    ...
    _     -> (x,y)

scene : (Float,Float) -> Float -> State -> Picture
scene _ _ (x,y) =
  group
  [ image (45,45) "http://elm-lang.org/imgs/mario/stand/right.gif" |> move (x,y) ]

main = displayWithState (-200,-150) (200,150) scene initial update Nothing
```

wird daher zunächst ein "Typ" definiert, eine Angabe woraus die Zustandsinformationen zu jedem Zeitpunkt bestehen sollen.
Hier soll es jeweils ein Paar von Fließkommazahlen sein (was wir gleich als eine Position im Koordinatensystem interpretieren werden).

Dann gilt:

* Der Initialzustand muss natürlich von diesem Typ sein, was durch `initial : State` angezeigt wird.

* Die Typangabe `update : Event -> (Float,Float) -> Float -> State -> State` bedeutet (wie schon benutzt, aber bisher nicht explizit ausgedrückt), dass diese Funktion als Eingaben ein Ereignis, die aktuelle Mausposition, den aktuellen Zeitwert und den erinnerten Zustand nimmt, und als Ausgabe einen potentiell veränderten Zustand liefert.

* Schließlich ist auch eine Typangabe für `scene` möglich: diese Funktion nimmt die aktuelle Mausposition, den aktuellen Zeitwert und den aktuellen Zustand, und liefert ein anzuzeigendes Bild.

Aufgabe: Vervollständige obiges Programm, so dass "Mario" mit den vier Pfeiltasten in geeignet großen Schritten bewegt werden kann, jedoch nicht über den Rand des sichtbaren Bereichs hinaus kann. (Beachte dass sich `x` und `y` oben nicht mehr wie zuvor auf die aktuelle Mausposition beziehen, sondern, wie sich aus der Eigenschaft als viertes bzw. drittes Argument von `update` bzw. `scene` ergibt, aus dem aktuell gespeicherten Zustand stammen).

<!--
[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/Playground9.elm)
-->

Zusatz: Erweitere nun das Programm, so dass wenn Mario nach links oder rechts läuft, er auch in die entsprechende Richtung guckt. Praktischerweise steht neben "http://elm-lang.org/imgs/mario/stand/right.gif" auch "http://elm-lang.org/imgs/mario/stand/left.gif" bereit. Um das gewünschte Verhalten zu realisieren, ist jedoch auch eine Erweiterung des Zustandstyps nötig, mindestens von einem Paar zu einem Tripel. Denkbar wäre zum Beispiel, `State` so anzupassen, dass neben den zwei Fließkommazahlen auch noch direkt das aktuell gerade relevante Bild (Mario nach rechts guckend oder Mario nach links guckend) gespeichert wird.

---

[Zusatz](Fraktal.md)

