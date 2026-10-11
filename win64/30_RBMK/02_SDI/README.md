# RBMK64 & RBMK32 — OpenGL Engines in Pure MASM

RBMK64 and RBMK32 are two Windows OpenGL programs, both written in **pure assembly** using the **Microsoft MASM toolchain**.

They are **not a port**. They are two independent implementations of the same design, written in two different assembly dialects, with different ABIs, different toolchains, and different GL pipelines underneath.

- **RBMK32 source:** [win32/05_RBMK](https://github.com/Singeleitsev/asm/tree/master/win32/05_RBMK/)
- **RBMK64 source:** [win64/30_RBMK/02_SDI](https://github.com/Singeleitsev/asm/tree/master/win64/30_RBMK/02_SDI)

<p align="center">
  <a href="https://github.com/Singeleitsev/asm/tree/master/win32/05_RBMK/">
    <img src="https://raw.githubusercontent.com/Singeleitsev/asm/master/win32/05_RBMK/CompaqRBMK.jpg" width="45%" alt="RBMK32 running on a Compaq (year 2000 hardware)">
  </a>
  <a href="https://github.com/Singeleitsev/asm/tree/master/win64/30_RBMK/02_SDI">
    <img src="https://raw.githubusercontent.com/Singeleitsev/asm/master/win64/30_RBMK/02_SDI/820FPS.png" width="45%" alt="RBMK64 running at 820 FPS">
  </a>
</p>

<p align="center">
  <em>Left: RBMK32 on period-correct hardware. Right: RBMK64 rendering at 820 FPS.</em>
</p>

---

## What's the same

### Interface
- Menu without `.rc` file
- Accelerators
- Status bar showing runtime coordinates
- Title bar showing runtime FPS

### Scene
- Regular grid of RBMK top surface
- Camera and light settings

### Controls
- **Camera move:** Arrow keys, PgUp/PgDn
- **Object move:** W, S, A, D, Q, E
- **Camera rotate:** Left mouse button
- **Camera pan:** Mouse wheel down
- **Camera dolly:** Mouse scroll
- **Object rotate:** Right mouse button

### Other
- Logging system
- Number formatting logic
- Matrix math (same design, different implementations)

---

## What's different

### RBMK32
- **32-bit GPRs** — only 6 registers available
- **SIMD:** SSE1
- **Graphics API:** OpenGL 1.1
- **Requires:** Pentium III or later
- **Era:** circa year 2000

### RBMK64
- **64-bit GPRs** — 14 registers available
- **SIMD:** SSE2
- **Graphics API:** OpenGL 3.3 with VBO/VAO and shaders
- **Requires:** Pentium 4 with EM64T and GeForce 8 Series (for OpenGL 3.3)
- **Era:** circa year 2010
