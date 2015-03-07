[Zurück](Bouncing.md)

---

# Siebte Aufgabe

Verändere folgendes Programm:

```elm
import List

objects = [ (0, circle 10)
          , (pi/2, square 15)
          , (pi, circle 10)
          , (3/2*pi, square 15)
          ]

scene (x,y) t =
  let
    fun i (alpha, form) =
      let
        (ax,ay) = (120 * cos(alpha + t/1500), 120 * sin(alpha + t/1500))
        image = group [form, text (toString i)]
      in
       move (ax,ay) image
  in
   List.indexedMap (fun << toFloat) objects

main = show scene (Just (FPS 50))
```

so dass interessantes, von sowohl der Zeit als auch der Mausbewegung abhängiges Verhalten entsteht.
Zum Beispiel [so etwas](http://jvoigtlaender.github.io/Elm-Kurs/examples/Kreativ.html).

Der Kreativität freien Lauf!

