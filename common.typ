#import "prooftree/prooftree.typ": *

#let exercise_counter = counter("exercise")
#let exercise(content)  = [
  #parbreak()
  #exercise_counter.step()
  *Exercise #exercise_counter.display().* #h(0.5em)
  #content
]
#let solution(content) = [
  #parbreak()
  *Solution.* #h(0.5em)
  #content
  #v(2em)
]

#let multieq(numbering: none, es) = {
  let concat(a) = a.slice(1).fold(a.first(), (acc, x) => acc + x)
  set math.equation(numbering: numbering) 
  let esf = es.children.filter(x => x != [ ])

  let hidden = box[
    #show math.equation: set block(spacing: 0.65em)
    #concat(esf.map(e => $ #hide(e.body) $))
  ]

  let folder(acc, e) = acc + if acc != [] { linebreak() } + e
  let aligned = math.equation(block: true, numbering: none, esf.fold([], folder))

  box[
    #hidden
    #place(start + top, box(width: 100%, aligned))
  ]
}

#let Itheory = text("I", font: "cmsy10")
#let DY = $italic("DY")$
#let IDY = $Itheory_DY$

#let Eenc = $E_(italic("enc"))$

#let sk = $italic("sk")$
#let pk = "pk"
#let aenc = "aenc"
#let adec = "adec"
#let senc = "senc"
#let sdec = "sdec"
#let fst = "fst"
#let snd = "snd"
#let tup(..xs) = $angle.l #xs.pos().join(",") angle.r$
#let ìn = "in"
#let out = "out"
#let ìf = "if"
#let then = "then"
