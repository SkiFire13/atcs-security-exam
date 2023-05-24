#import "/common.typ": *

#exercise[
  (Message deduction). Consider the inference system $IDY$ for the Dolev-Yao attacker (See [2] on page 14).
  + Construct a proof tree that solves the following message deduction problem:
    $sk_A, sk_B, aenc(n_A, pk(sk_B)), senc(aenc(n_B, pk(sk_A)), n_A), senc(s, angle.l n_A, n_B angle.r) tack.r_IDY s$
  + Explain why $IDY$ is called a _local theory_.
]
#solution[
  + 
    #[
      #set text(size: 9pt)
      #prooftree(
        hspacing: 0pt,
          axiom($senc(s, angle.l n_A, n_B angle.r)$),

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

          rule(n: 2, $angle.l n_A, n_B angle.r$),

        rule(n: 2, $s$),
      )
    ]
]