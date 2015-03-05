Vervollständige, um 10 konzentrische Kreise zu malen, von denen die inneren fünf rot, die äußeren fünf grün sind:

```elm
import List

scene _ _ =
  List.map ithCircle [ 1 .. 10 ]

ithCircle i = ...

main = show scene Nothing
```

Zielbild, etwa:

![Farbige Kreise](images/Kreise.png)
