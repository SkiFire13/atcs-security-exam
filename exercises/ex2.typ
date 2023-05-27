#import "/common.typ": *

#exercise[
  (Deduction under equational theories). Consider following equational theory $Eenc$, which correspond to the inference system $IDY$:
  $
    sdec(senc(x, y), y) = x & #h(2em)
    adec(aenc(x, pk(y)), y) = x \
    fst(tup(x, y)) = x & #h(2em)
    snd(tup(x, y)) = y
  $
  + Convert the proof tree of Exercise 1 into a proof tree that uses the equational theory (See $S tack.r_Eenc t$, [2] page 23).
]
#solution[
  \ #v(0.5em)
  +
    #move(dx: -1.3cm)[
      #set text(size: 9pt)
      #prooftree(
        hspacing: 0pt,
          axiom($senc(s, tup(n_A, n_B))$),

              axiom($aenc(n_A, pk(sk_B))$),
              axiom($sk_B$),
            rule(n: 2, $adec(aenc(n_A, pk(sk_B)), sk_B)$),
            rule($n_A$),

                axiom($senc(aenc(n_B, pk(sk_A)), n_A)$),

                  axiom($aenc(n_A, pk(sk_B))$),
                  axiom($sk_B$),
                rule(n: 2, $adec(aenc(n_A, pk(sk_B)), sk_B)$),
                rule($n_A$),

              rule(n: 2, $sdec(senc(aenc(n_B, pk(sk_A)), n_A), n_A)$),
              rule($aenc(n_B, pk(sk_A))$),
              axiom($sk_A$),
            
            rule(n: 2, $adec(aenc(n_B, pk(sk_A)), sk_A)$),
            rule($n_B$),

          rule(n: 2, $tup(n_A, n_B)$),

        rule(n: 2, $sdec(senc(s, tup(n_A, n_B)), tup(n_A, n_B))$),
        rule($s$),
      )
    ]
]
