[Zurück](Reuse.md)

---

# Dritte Aufgabe

Male ein gleichseitiges, grünes Dreieck mit einbeschriebenem, rot gestricheltem Berührkreis, so dass dieser den Radius 25 hat.  

* Hinweis zum Styling:  
  Von den Funktionen `rectangle`, `square`, `circle`, `oval`, `path` gibt es Varianten, die uns das Aussehen der gezeichneten Linien verändern lassen.
  Während zum Beispiel `rectangle' (solid black) (30,20)` äquivalent zum schon gesehenen `rectangle (30,20)` ist, geht auch `rectangle' (dashed red) (30,20)`:  
  ![rectangle'](../images/rectangle'.png)  
  oder auch etwa `oval' (dotted blue) (30,20)`:  
  ![oval'](../images/oval'.png)  
  Eine Übersicht vorhandener Farben und Möglichkeiten zur Erzeugung neuer finden Sie [hier](http://package.elm-lang.org/packages/elm-lang/core/latest/Color).

* Geometrischer Hinweis:  
  Die Beziehung zwischen Seitenlänge `a` und Inkreisradius `r` in einem gleichseitigen Dreieck beträgt `r = a/sqrt(12)`. Außerdem gilt für die Höhe des Dreiecks `h = 3*r`.

Zielbild:

![Inkreis](../images/Inkreis.png)

Dann: Schreibe und verwende eine Funktion, welche diese Aufgabe nicht nur für Radius 25 löst.  

