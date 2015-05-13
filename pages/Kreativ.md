[Zurück](Bouncing.md)

---

# Siebte Aufgabe

Verändere folgendes Programm:

```elm
import Color exposing (..)

list =
  [ (circle 10, 0)
  , (square 15, pi/2)
  , (circle 10, pi)
  , (square 15, 1.5*pi)
  ]

scene (x,y) t =
  let
    fun i (form, alpha) =
      let
        (a,b) = (120 * cos(alpha + t/1.5), 120 * sin(alpha + t/1.5))
        image = group [form, text (toString i)]
      in
        image |> move (a,b)
  in
    group (List.indexedMap (fun << toFloat) list)

main = display (400,300) scene (Just (FPS 50))
```

so dass interessantes, von sowohl der Mausbewegung als auch der Zeit abhängiges Verhalten entsteht.
Zum Beispiel [so etwas](http://jvoigtlaender.github.io/Elm-Kurs/examples/Kreativ.html).

<!--
[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/Playground7.elm), [@share-elm](http://share-elm.com/sprout/553a8901e4b06aacf0e89845/0.15/view)
-->

Der Kreativität freien Lauf!

Zusätzliche Ausdrucksmöglichkeiten ergeben sich durch [Font Awesome Icons](http://fontawesome.io/icons/).
Dafür muss zu Beginn noch ein `import FontAwesome` hinzu, dann zum Beispiel Verwendung von `icon 20 FontAwesome.space_shuttle` oder `icon' red 30 FontAwesome.ambulance`.
(Die passenden Namen finden Sie [hier](http://package.elm-lang.org/packages/jystic/elm-font-awesome/latest/FontAwesome).)

---

Beispielausdrücke zur Erinnerung:

* `rectangle (30,20)`
* `path [ (0,0), (15,15), (30,-15), (40,5) ]`
* `circle' (dashed red) r |> move (x,y)`
* `if ... then ... else ...`

---

[Zusatz](Fraktal.md)

