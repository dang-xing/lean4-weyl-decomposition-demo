# Lean 4 Weyl decomposition demo

This standalone example formalizes the two-dimensional Weyl matrix basis
`I, X, Z, XZ`, with `X` the shift and `Z` the phase. Lean verifies that
the basis expansion reconstructs twice any integer 2×2 matrix. Scaling by
two keeps the coefficients integral. The file also checks a concrete matrix.

With the toolchain pinned in `lean-toolchain`, run:

```sh
lake build
```
