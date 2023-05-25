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

#let Itheory = text("\u{1D4D8}", font: "Times New Roman")
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
