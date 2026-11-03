# FC4MSX Gerber Production Files

This directory contains the production-ready Gerber and NC drill files for manufacturing the FC4MSX PCB.

## Bare PCB Photos (v1.0.3)

| Component Side (Front) | Solder Side (Back) |
| :---: | :---: |
| ![PCB Front](../images/pcb_front_nobg.png) | ![PCB Back](../images/pcb_back_nobg.png) |

## Instant Order ZIP Package
- **[`FC4MSX-Gerbers-v1.0.3.zip`](../releases/FC4MSX-Gerbers-v1.0.3.zip)**: Pre-packaged archive ready for upload to PCB manufacturers (JLCPCB, PCBWay, AISLER, etc.). See all packages in the [releases](../releases/) directory.

---

## 📄 File Inventory
| Filename | Description | Layer |
| :--- | :--- | :--- |
| `FC4MSX-F_Cu.gbr` | Front (Top) Copper | Layer 1 |
| `FC4MSX-B_Cu.gbr` | Back (Bottom) Copper | Layer 2 |
| `FC4MSX-F_Mask.gbr` | Front Solder Mask | Top Mask |
| `FC4MSX-B_Mask.gbr` | Back Solder Mask | Bottom Mask |
| `FC4MSX-F_Silkscreen.gbr` | Front Silkscreen | Top Legend |
| `FC4MSX-B_Silkscreen.gbr` | Back Silkscreen | Bottom Legend |
| `FC4MSX-Edge_Cuts.gbr` | Board Outline & Cutouts | Mechanical Outline |
| `FC4MSX.drl` | NC Drill File | Plated & Non-Plated Holes |
| `FC4MSX-drl_map.gbr` | Drill Map | Fabrication Drawing |
| `FC4MSX-job.gbrjob` | KiCad Gerber Job File | Layer Stackup & Parameters |
| `FC4MSX-F_Paste.gbr` / `FC4MSX-B_Paste.gbr` | Solder Paste (SMD pads) | Stencil |

---

## Recommended PCB Fabrication Options
- **Layers:** 2
- **Thickness:** 1.6 mm (standard for MSX cartridge slot connector)
- **Surface Finish:** **ENIG (Electroless Nickel Immersion Gold)** is strongly recommended for wear-resistance on the 50-pin edge connector. Lead-Free HASL is acceptable for budget prototyping.
- **Edge Connector Chamfer:** **45° Bevel / Chamfer** (essential for inserting the cartridge smoothly into the MSX cartridge slot without damaging connector contacts).
