[Zur�ck](Start.md)

---

# Erste Aufgabe

Vervollst�ndige `Nikolaus.elm`, um das Haus des Nikolaus zu malen:

```elm
scene _ _ =
  group
  [ rectangle (100,130)
  , path [ (-50,-65), (50,65) ]
  ]

main = display (-200,-150) (200,150) scene Nothing
```

Zielbild, etwa:

![Haus des Nikolaus](../images/Nikolaus.png)

Zusatz 1: Male einen kleinen Kreis um die Hausspitze.

Hinweis: Ein Teilbild kann an eine beliebige Position verschoben werden mit `image |> move (x,y)`, wobei `image` der Ausdruck ist, der das Bild beschreibt, und `(x,y)` die Angabe, um wie viel in x- bzw. y-Richtung verschoben werden soll.

Zusatz 2: Stelle "Mario" (`image (45,45) "http://elm-lang.org/imgs/mario/stand/right.gif"`) links neben das Haus. 

Zusatz 3: Male statt dem einen Haus drei nebeneinander stehende gleiche H�user.

---

[Weiter](Forms.md)

---

([Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task01/Nikolaus.elm), [@share-elm](http://share-elm.com/sprout/55896e9be4b06aacf0e8a75a/0.14/view))

