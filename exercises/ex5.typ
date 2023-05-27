#import "/common.typ": *

#let kAS = $k_(A S)$
#let kBS = $k_(B S)$

#exercise[
  (Secrecy and authentication). Model the following protocol in ProVerif. Does it satisfy the desired _Security Properties_ (listed at the end)? Present adequate queries that prove or disprove each claim of _authentication, integrity, confidentiality_.

  #multieq(numbering: "(1)")[
    $ & A -> S : \{{A}_pk_B, B\}_kAS $
    $ & S -> B : \{{A}_pk_B\}_kBS $
    $ & B -> A : {N_b}_pk_A $
    $ & A -> B : {m}_N_b $
    $ & B -> A : h(m) $
  ]

  *Security properties:*
  + _Authentication_: when $B$ accepts $m$, it's certain that it comes from $A$.
  + _Integrity_: $A$ is certain that $B$ has accepted $m$ by receiving $h(m)$ in (5)
  + _Confidentiality_: $A$ and $B$ are the only ones who know $m$.
]
#solution[
  #show raw.where(lang: "proverif"): it => {
    let highlight_regex(rg, color) = (s, next) => {
      let match = s.match(rg)
      if match == none {
        return next(s)
      }
      let out = []
      while match != none {
        out += next(s.slice(0, match.start))
        out += text(match.text, fill: color)
        s = s.slice(match.end)
        match = s.match(rg)
      }
      out + next(s)
    }

    let highlight(text, passes) = {
      if passes.len() == 0 {
        text
      } else {
        passes.at(0)(text, text => highlight(text, passes.slice(1)))
      }
    }

    highlight(
      it.text,
      (
        highlight_regex(regex("\(\*.*\*\)"), rgb("#6A9955")),
        highlight_regex(regex("type|fun|reduc|forall|channel|event|query|attacker|new|let| in|out|process|bang|!|\|"), rgb("#f44747")),
        highlight_regex(regex("bitstring|pkey|skey"), rgb("#267f99")),
      )
    )
  }

  #raw(read("ex5.pv"), lang: "proverif")
]
