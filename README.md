# HYPRE Conda Packaging Repo

This repository only contains the files needed to build HYPRE conda packages
and validate the recipe in GitHub Actions.

## Upstream source pin

The default recipe builds from the upstream HYPRE repository:

- URL: `https://github.com/hypre-space/hypre.git`
- Git revision: `9dc9e18aed6a945a95f966e57daacfb1c269f6ec`
- Upstream tag: `v3.1.0`

The source pin lives in [conda-recipe/meta.yaml](conda-recipe/meta.yaml). CI
checks the recipe by running `conda render` and `conda build` across the MPI
and OpenMP variant matrix.

## Local build

```bash
conda build conda-recipe \
  --channel conda-forge \
  --override-channels
```

To test a different upstream snapshot without editing the recipe, override the
pin with environment variables:

```bash
HYPRE_VERSION=3.1.0 \
HYPRE_GIT_URL=https://github.com/hypre-space/hypre.git \
HYPRE_GIT_REV=9dc9e18aed6a945a95f966e57daacfb1c269f6ec \
conda build conda-recipe --channel conda-forge --override-channels
```
