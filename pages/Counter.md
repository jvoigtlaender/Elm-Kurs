[Zurück](Kreativ.md)

---

# Achte Aufgabe

Um komplexeres Verhalten zu beschreiben, ist es (neben weiteren Eingabemöglichkeiten abseits der Maus) allgemein nützlich, einen "erinnerten Zustand" verwenden zu können, um nicht jeweils nur die Zeit und aktuelle Mausposition zur Bestimmung des Anzuzeigenden zur Verfügung zu haben.

Hier zunächst ein recht einfaches Beispiel:

```elm
initial = 0

update event _ _ state =
  case event of
    Space -> state + 1
    _     -> state

scene _ _ state =
  group
  [ text (toString state) ]

main = displayWithState (-200,-150) (200,150) scene initial update Nothing
```

Es gibt einige Dinge zu erklären:

* Wir müssen ausdrücken, was der "erinnerte Zustand" ganz am Anfang sein soll, wenn es noch gar keine zu erinnernde Vergangenheit gibt. Da wir hier einen einfachen Zähler realisieren wollen, setzen wir dafür die Zahl `0`.

* Wir müssen ausdrücken, wie sich der Zustand (`state`) ändern soll, wenn ein Ereignis (`event`) eintritt. Dies geschieht in der `update`-Funktion. Sie führt mittels `case ... of ...` eine Fallunterscheidung auf dem Ereignis durch. Hier wollen wir zunächst nur auf das Ereignis "Leertaste wurde gedrückt" (`Space`) reagieren, und zwar in diesem Fall den Zählerstand um `1` erhöhen.

* Um auszudrücken, dass sich in jedem anderen Fall (als dass die Leertaste gedrückt wurde) überhaupt nichts ändern soll, verwenden wir die Zeile `_ -> state`. Eine solche oder ähnliche Zeile sollte es im Folgenden immer geben.

* In der `scene`-Funktion steht nun der jeweils aktuelle Zustand als weitere Eingabe zur Verfügung und kann zur Berechnung der Ausgabe (also der zu machenden Anzeige) verwendet werden. Hier geben wir den aktuellen Zählerstand einfach nur direkt aus. Die aktuelle Mausposition und Zeit ignorieren wir dabei (ebenso in der `update`-Funktion).

* Mittels der `displayWithState`-Funktion bringen wir schließlich alles zusammen.

Aufgabe: Verändere obiges Programm, so dass der Zähler bei `10` startet, mittels der Pfeil-Nach-Oben-Taste erhöht und mittels der Pfeil-Nach-Unten-Taste verringert wird, allerdings nie unter `0` sinkt. Außerdem soll die Leertaste nun dazu dienen, den Zähler jederzeit auf `0` setzen zu können. (Für die vier Pfeiltasten existieren die Ereignisnamen `Left`, `Up`, `Right` und `Down`.)

---

[Zusatz](Fraktal.md)

