[Zurück](Bouncing.md)

---

# Siebte Aufgabe

Verändere folgendes Programm (`Kreativ.elm`):

```elm
list =
  [ (circle 10, 0)
  , (square 15, pi/2)
  , (circle 10, pi)
  , (square 15, 1.5*pi)
  ]

scene (x,y) t =
  let
    fun i (pic, alpha) =
      let
        (a,b) = (120 * cos(alpha + t/1.5), 120 * sin(alpha + t/1.5))
        image = group [pic, text (toString i)]
      in
        image |> move (a,b)
  in
    group (List.indexedMap (fun << toFloat) list)

main = display (-200,-150) (200,150) scene (Just AnimationFrame)
```

so dass interessantes, von sowohl der Mausbewegung als auch der Zeit abhängiges Verhalten entsteht.
Zum Beispiel [so etwas](http://jvoigtlaender.github.io/Elm-Kurs/examples/Kreativ.html).

Der Kreativität freien Lauf!

Zusätzliche Ausdrucksmöglichkeiten ergeben sich durch [Font Awesome Icons](http://fontawesome.io/icons/).
Dafür muss zu Beginn noch ein `import FontAwesome` hinzu, dann zum Beispiel Verwendung von `icon 20 FontAwesome.space_shuttle` oder `icon' red 30 FontAwesome.ambulance`.
(Die passenden Namen findet man [hier](http://package.elm-lang.org/packages/jystic/elm-font-awesome/latest/FontAwesome).)

---

Beispielausdrücke zur Erinnerung:

* `rectangle (30,20)`
* `path [ (0,0), (15,15), (30,-15), (40,5) ]`
* `circle' (dashed red) r |> move (x,y)`
* `if ... then ... else ...`

---

[Weiter](Counter.md)

---

([Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task07/Kreativ.elm), [@share-elm](http://share-elm.com/sprout/558970ede4b06aacf0e8a760/0.14/view))

