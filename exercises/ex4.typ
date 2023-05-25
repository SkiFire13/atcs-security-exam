#import "/common.typ": *

#exercise[
  (Observational equivalence).
  + Show that $A approx.not B$
    $
      & A = ìn(c, x); ìn(c, y); mu s; mu k; out(c, pk(k)); ìf x eq.not y then out(c, aenc(tup(x, y, s), pk(k))) \
      & B = ìn(c, x); ìn(c, y); mu s; mu k; out(c, pk(k)); ìf x eq.not y then out(c, aenc(tup(x, y), pk(k)))
    $
]
#solution[
  Consider: \
  $
    C[\_] = out(c, 0); out(c, 1); in(c, p); in(c, e);
    ìf e = aenc(tup(0, 1), p) then out(a, 0) || \_
  $
  We have $C[B] ->* out(a, 0)$, thus $C[B] arrow.b.double a$, but $C[A]$ can never emit on $a$ because $aenc(⟨x, y, s⟩, pk(k)) != aenc(tup(x, y), pk(k))$
]