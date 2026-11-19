import Std.Tactic

namespace WeylDemo

structure Matrix2 where
  a00 : Int
  a01 : Int
  a10 : Int
  a11 : Int
  deriving DecidableEq, Repr

def Matrix2.add (a b : Matrix2) : Matrix2 :=
  ⟨a.a00 + b.a00, a.a01 + b.a01, a.a10 + b.a10, a.a11 + b.a11⟩

def Matrix2.scale (k : Int) (a : Matrix2) : Matrix2 :=
  ⟨k * a.a00, k * a.a01, k * a.a10, k * a.a11⟩

def one : Matrix2 := ⟨1, 0, 0, 1⟩
def shift : Matrix2 := ⟨0, 1, 1, 0⟩
def phase : Matrix2 := ⟨1, 0, 0, -1⟩
def shiftPhase : Matrix2 := ⟨0, -1, 1, 0⟩

/-- Expand twice the input in the two-dimensional Weyl basis I, X, Z, XZ. -/
def decomposeTwice (a : Matrix2) : Matrix2 :=
  (((one.scale (a.a00 + a.a11)).add (shift.scale (a.a10 + a.a01))).add
    (phase.scale (a.a00 - a.a11))).add (shiftPhase.scale (a.a10 - a.a01))

theorem decomposeTwice_correct (a : Matrix2) : decomposeTwice a = a.scale 2 := by
  cases a
  simp only [decomposeTwice, Matrix2.add, Matrix2.scale, one, shift, phase, shiftPhase]
  congr 1 <;> omega

example : decomposeTwice ⟨3, -2, 5, 7⟩ = ⟨6, -4, 10, 14⟩ := by decide

end WeylDemo
