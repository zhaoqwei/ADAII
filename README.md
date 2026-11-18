# ADAII: Alternating Depth-Domain Acoustic Impedance Inversion via Phase-Shift Forward Modeling

MATLAB implementation of the method described in

> Q. Zhao et al., "Alternating Depth-Domain Acoustic Impedance Inversion via Phase-Shift Forward Modeling," *IEEE Transactions on Geoscience and Remote Sensing*, <<year>>, doi: <<DOI>>.

The code reproduces the synthetic experiments of the paper on the Marmousi model. Field-data examples in the paper use proprietary data and are therefore not included (see Section 8).

---
## 1. Method overview

ADAII inverts depth-domain post-stack seismic data directly for acoustic impedance without time-to-depth conversion. The forward operator is built from a **phase-shift extrapolation** in the frequency–depth domain, which maps a depth-domain reflectivity series into the recorded seismic trace using the (known) interval velocity. Because the depth-domain wavelet is depth-variant, the inversion is solved by **alternating** between

1. **Reflectivity / impedance update** — sparse (L1) inversion of the reflectivity given the current depth-variant wavelet matrix, solved with Split Bregman iteration;
2. **Wavelet-matrix update** — re-estimation of the band-limited depth-variant wavelet operator given the updated reflectivity.

The two steps are repeated until the data misfit stops decreasing or the maximum number of outer iterations is reached. Impedance is then recovered from the reflectivity by recursive integration from a low-frequency initial model.

---

## 2.Requirements
### 2.1 CREWES MATLAB Toolbox
[CREWES](https://www.crewes.org/)  
The plotting utilities rely on the free [CREWES MATLAB Toolbox](https://www.crewes.org/ResearchLinks/FreeSoftware/) (University of Calgary).

1. Download the toolbox (registration is free) and unzip it, e.g. to `~/crewes` or `C:\crewes`.
2. Add it to the MATLAB path **before** running any script:

   ```matlab
   addpath(genpath('C:\crewes'));   % adjust to your location
   ```

   or simply run `setup.m` provided in this repository (edit the path on the first line).
   
### 2.2 Note on third-party dependencies

> **Important:** This code relies on a number of third-party functions (CREWES Toolbox, Split Bregman solver, plotting helpers, etc.). 
If you encounter errors caused by missing or incompatible third-party functions, please **comment out or modify the non-essential parts** (mainly plotting and figure-formatting calls such as `prepfigGEO`, `colorbarson`, `plotseisZ`) — they do not affect the inversion itself. 
For other problems, feel free to contact the author: **zhaoqwei001@163.com**.
## 3. Repository structure

```
ADAII/
├── ADAII.mlx                   Main Live Script: full workflow (data loading → forward
│                               modelling → alternating inversion → figures). START HERE.
│  --- Forward modelling ---
├── Phaseshift.m                Builds the phase-shift extrapolation operator  P(ω, z)
├── wavelet.m                   Ricker wavelet generator
├── GetW.m                      Compresses the nz×nz depth-variant wavelet matrix W into a
│                               banded (2nw+1)×nz form around the wavelet peak
├── AGetW.m                     Inverse of GetW: expands the banded form back to nz×nz
│
│  --- Inversion ---
├── L1_SplitBregmanIteration.m  L1-regularised least-squares solver (Split Bregman)
│                               Third-party code by J. Gilles (UCLA), see Section 9
│
│  --- Utilities ---
├── AddNoisedb.m                Adds white Gaussian noise at a prescribed SNR (dB)
├── plotseisZ.m                 Depth-axis seismic section plotting
├── prepfigGEO.m                Figure formatting for publication
├── colorbarson.m               Colour-bar helper
│
│  --- Data (Marmousi model) ---
├── marmousivp.mat              P-wave velocity model          [nz × nx], m/s
├── marmousidensity.mat         Density model                  [nz × nx], kg/m³ 
├── marmousiDz5.mat             Resampled model, dz = 5 m      (used in the paper's examples)
├── dataOrig.mat                Marmousi synthetic data from SEG OPEN DATA
└── README.md
```

---
## 4. Quick start

```matlab
% 1. clone
%    git clone https://github.com/zhaoqwei/ADAII.git
%    cd ADAII

% 2. set paths (edit the CREWES location inside setup.m first)
setup
 
% 3. run the full workflow
open ADAII.mlx          % then press "Run", or:
```

---
## 5. Workflow inside `ADAII.mlx`, step by step
  1. Forward modeling on the Marmousi model and comparison with the open-data Marmousi synthetic data.

  2. Marmousi model simulation.

  2.1 forward.

  2.2 test Alternating Inversion.

## Cite
```bibtex
@article{zhao2026adaii,
  title   = {Alternating Depth-Domain Acoustic Impedance Inversion via Phase-Shift Forward Modeling},
  author  = {<<Zhao, Qingwei and ...>>},
  journal = {IEEE Transactions on Geoscience and Remote Sensing},
  year    = {<<2026>>},
  volume  = {<<>>},
  pages   = {<<>>},
  doi     = {<<>>}
}
```
