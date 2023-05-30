#import "/common.typ": *

#exercise[
  (Static equivalence of frames). Which of the following pairs of frames are statically equivalent? For those that are not statically equivalent, present two distinguishing terms. That is, find a pair of terms $M$, $N$ such that:
  #align(center)[
    $(M =_Eenc N)_phi_1$ and $(M !=_Eenc N)_phi_2$ or viceversa
  ]
  #v(0.5em)
  + #box(width: 100%, inset: (bottom: 0.5em), align(center, $
      phi_1 = nu a, b, k. { h(senc(a, k)) \/ x, senc(b, k) \/ y } \
      phi_2 = nu a, b, k. { h(senc(b, k)) \/ x, senc(b, k) \/ y }
    $))
  + #box(width: 100%, align(center, $
      phi_1 = nu a, b, k. { aenc(tup(senc(a, k), c), pk(k)) \/ x, pk(k) \/ y, senc(a, k) \/ z } \
      phi_1 = nu a, b, k. { aenc(tup(senc(b, k), c), pk(k)) \/ x, pk(k) \/ y, senc(a, k) \/ z }
    $))
]
#solution[
  \ #v(0.5em)
  + They are not statically equivalent. Consider $M = x$ and $N = h(y)$:
    $
      (h(senc(a, k)) !=_Eenc h(senc(b, k)))_phi_1 \
      (h(senc(b, k))  =_Eenc h(senc(b, k)))_phi_2
    $
  + They are not statically equivalent. Consider $M = x$ and $N = aenc(tup(z, c), y)$:
    $
      (aenc(tup(senc(a, k), c), pk(k))  =_Eenc aenc(tup(senc(a, k), c), pk(k)))_phi_1 \
      (aenc(tup(senc(b, k), c), pk(k)) !=_Eenc aenc(tup(senc(a, k), c), pk(k)))_phi_2
    $
]
