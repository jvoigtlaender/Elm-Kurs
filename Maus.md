Vervollständige nun so, dass immer genau die Kreise rot sind, die näher am Koordinatenursprung sind als der Mauszeiger (und die anderen grün):

```elm
import List

scene p _ =
  List.map (ithCircle p) [ 1 .. 10 ]

ithCircle (x,y) i = ...

main = show scene Nothing
```

