[Zurück](Stamping.md)

---

# Elfte Aufgabe

Oft soll eine Zustandsveränderung nicht nur bei spezifischen Ereignissen wie Tastendrücken eintreten, sondern auch wenn "lediglich" Zeit vergeht. Betrachte [dieses Beispiel](http://jvoigtlaender.github.io/Elm-Kurs/examples/Ballistics.html), das wir jetzt umsetzen wollen. (Welchen beobachtbaren Effekt hat wiederholtes Drücken der `W`-Taste während des Flugs?)

Zu jedem Zeitpunkt hat die Kanonenkugel eine bestimmte Position und Geschwindigkeit (jeweils als Vektoren darstellbar), diese müssen also Teil der Zustandsinformation sein. Unten ist bereits ausprogrammiert, wie sich das Drücken der `W`-Taste auf diesen Teil des Zustands auswirken soll, insbesondere auf die `x`-Komponente des Geschwindigkeitsvektors. Unabhängig davon muss sich der Zustand jedoch auch ändern, wenn einfach nur Zeit vergeht. Zu diesem Zweck kann in `update` auf den aktuellen Zeitwert zugegriffen werden. Daneben sollte man aber auch wissen, was der Zeitwert des letzten "Ticks" war, um die seitdem vergangende Zeit bestimmen zu können. Daher wird der letzte relevante Zeitwert (ganz am Anfang `0`) auch noch zum Teil der Zustandsinformation gemacht.

Vervollständige die `update`-Funktion in folgendem Programm (`Ballistics.elm`):

```elm
type alias Position = (Float,Float)
type alias Velocity = (Float,Float)
type alias State = (Float, Position, Velocity)

alpha = pi/4

initial : State
initial = (0, (10 * cos(alpha), 10 * sin(alpha)), (40 * cos(alpha), 40 * sin(alpha)))

update : Event -> (Float,Float) -> Float -> State -> State
update event _ t' state =
  case (event, state) of
    (W, (t, (x,y), (vx,vy))) -> (t, (x,y), (vx - 5,vy))
    (_, (t, (x,y), (vx,vy))) ->
      let
        dt = t' - t
        x' = ...
        y' = ...
        vx' = ...
        vy' = ...
      in
        (t', (x',y'), (vx',vy'))

scene : (Float,Float) -> Float -> State -> Picture
scene _ _ (_, (x,y), _) =
  group
  [ rectangle (10,2) |> move (5,0) |> rotate alpha
  , circle 1 |> move (x,y)
  ]
  |> scale 3

main = displayWithState (-10,-10) (600,300) scene initial update (Just AnimationFrame)
```

so dass die physikalische Simulation korrekt abläuft.

Hinweise:

* Für die Berechnung der neuen Positions- und Geschwindigkeitsvektoren aus den alten ist die Idee der numerischen Integration hilfreich. (Das Zeitdelta `dt` ist ja jeweils bekannt, siehe oben.)

* Die Erdbeschleunigung beträgt `9.81`.

Denkbare Erweiterungen:

* Visualisiere innerhalb der `scene`-Funktion geeignet den Geschwindigkeitsvektor an die Kanonenkugel.

* Sorge dafür, dass die Kanonenkugel nicht sofort bei Start des Programms abgefeuert wird, sondern zum Beispiel erst nach Drücken der Leertaste, und dass vorher mittels Pfeiltasten der Winkel `alpha` des Kanonenrohrs verändert werden kann. (Dafür muss natürlich der Winkel zusätzlicher Teil der Zustandsinformation werden. Außerdem muss eine Information darüber gespeichert werden, ob oder ob nicht die Kugel bereits abgefeuert wurde. Dafür eignet sich der "Typ" `Bool` mit den Wahrheitswerten `False` und `True`, auf denen mit `if ... then ... else ...` gearbeitet werden kann.)

* Mache auch die Geschwindigkeit vor dem Abfeuern per Pfeiltasten veränderlich.

Eine Beispielrealisierung mit diesen Erweiterungen (und zusätzlich der Unterstützung mehrfachen Abfeuerns) läuft [hier](http://jvoigtlaender.github.io/Elm-Kurs/examples/Ballistics_Full.html).

---

[Zusatz](Fraktal.md)

---

([Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task11/Ballistics.elm), [@share-elm](http://share-elm.com/sprout/558973cfe4b06aacf0e8a765/0.14/view))

