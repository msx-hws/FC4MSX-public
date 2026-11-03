# Bill of Materials (BOM) - FC4MSX

Interactive BOM is available at: [**`bom/ibom.html`**](ibom.html) (open directly in any modern web browser for an interactive PCB placement visualizer and component checklist).

---

## Component List

| Reference | Value / Part | Description | Package / Footprint | Qty |
| :--- | :--- | :--- | :--- | :---: |
| **U1** | **WD37C65** | Floppy Disk Controller (WD37C65 / compatible) | DIP-40 (600mil / 15.24mm) | 1 |
| **U2** | **74LS04** | Hex Inverter | DIP-14 (300mil / 7.62mm) | 1 |
| **U3** | **74LS138** | 3-to-8 Line Decoder / Demultiplexer | DIP-16 (300mil / 7.62mm) | 1 |
| **U4** | **W27C512** | 64K x 8 EEPROM / EPROM (MSX Disk ROM) | DIP-28 (600mil / 15.24mm) | 1 |
| **Y1** | **16 MHz** | Crystal Oscillator | DIP-8 (Full-size / Half-size footprint) | 1 |
| **C1, C2, C3, C4, C5** | **100nF (0.1µF)** | Decoupling Capacitors (Ceramic) | THT Disc (Lead Pitch 2.50mm) | 5 |
| **C6** | **22µF** | Electrolytic Filter Capacitor (16V+) | Radial (Lead Pitch 2.00mm, Dia 5.0mm) | 1 |
| **R1, R2, R3, R4** | **150 Ω** | Resistors (1/4W 5%) | Axial DIN0207 (Pitch 10.16mm) | 4 |
| **R5** | **1 kΩ** | Resistor (1/4W 5%) | Axial DIN0207 (Pitch 10.16mm) | 1 |
| **JP1, JP2, JP3, JP4** | **Solder Jumpers** | 3-way Solder Jumpers (Open) | SMD Solder Jumper 3-pad | 4 |
| **J1** | **MSX Cartridge** | 50-Pin MSX Cartridge Edge Connector | PCB Gold Fingers (Integrated) | 1 |
| **J2** | **FDD Connector** | 34-Pin (2x17) Floppy Header, 2.54mm pitch | Vertical Pin Header / Boxed Shrouded | 1 |

---

## Recommended Sockets & Hardware
- **DIP-40 Socket:** 1x 40-pin 600mil socket (for U1 - WD37C65)
- **DIP-28 Socket:** 1x 28-pin 600mil socket (for U4 - W27C512)
- **DIP-16 Socket:** 1x 16-pin 300mil socket (for U3 - 74LS138)
- **DIP-14 Socket:** 1x 14-pin 300mil socket (for U2 - 74LS04)
- **DIP-8 Socket:** 1x 8-pin socket (optional, for Y1 oscillator)
- **Enclosure Screws:** 2x or 4x M2.5 / M2 screws (see `3d-enclosure/README.md`)
