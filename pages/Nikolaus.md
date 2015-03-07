# Erste Aufgabe

Vervollständige, um das Haus des Nikolaus zu malen:

```elm
scene _ _ =
   [ rectangle (100,130)
   , path [(-50,-65), (50,65)]
   ]

main = show scene Nothing
```

Zielbild, etwa:

![Haus des Nikolaus](../images/Nikolaus.png)

Zusatz 1: Male einen kleinen Kreis um die Hausspitze.

Zusatz 2: Stelle "Mario" (`image (45,45) "http://elm-lang.org/imgs/mario/stand/right.gif"`) links neben das Haus. 

[share-elm](http://share-elm.com/sprout/54f4c80ae4b09711f39c2f5d)

