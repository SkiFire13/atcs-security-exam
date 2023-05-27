#import "/common.typ": *

#exercise[
  (Message deduction). Consider the inference system $IDY$ for the Dolev-Yao attacker (See [2] on page 14).
  + Construct a proof tree that solves the following message deduction problem:
    $sk_A, sk_B, aenc(n_A, pk(sk_B)), senc(aenc(n_B, pk(sk_A)), n_A), senc(s, tup(n_A, n_B)) tack.r_IDY s$
  + Explain why $IDY$ is called a _local theory_.
]
#solution[
  \ #v(0.5em)
  + \
    #move(dx: -0.6cm)[
      #set text(size: 9pt)
      #prooftree(
        hspacing: 0pt,
          axiom($senc(s, tup(n_A, n_B))$),

              axiom($aenc(n_A, pk(sk_B))$),
              axiom($sk_B$),
            rule(n: 2, $n_A$),

                axiom($senc(aenc(n_B, pk(sk_A)), n_A)$),

                  axiom($aenc(n_A, pk(sk_B))$),
                  axiom($sk_B$),
                rule(n: 2, $n_A$),

              rule(n: 2, $aenc(n_B, pk(sk_A))$),
              axiom($sk_A$),
            rule(n: 2, $n_B$),

          rule(n: 2, $tup(n_A, n_B)$),

        rule(n: 2, $s$),
      )
    ]
    #v(2em)
  + $IDY$ is called a _local theory_ because if $S tack.r_IDY t$ then there exist a proof tree for it that uses only subterms of $S$ and $t$. This also means that a decision procedure for deduction in $IDY$ only needs to consider those subterms, thus guaranteeing termination if $S$ is finite.
]
