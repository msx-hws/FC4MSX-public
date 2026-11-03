# Assembly & Verification Guide

## Soldering Order

1. **Passive Components:**
   - Resistors R1–R5 (150Ω for R1–R4, 1kΩ for R5).
   - Ceramic decoupling capacitors C1–C5 (100nF).
2. **Jumpers:**
   - Solder jumpers JP1–JP4.
   - Default configuration: bridges between center pad and outer pad per your cable/drive configuration (see `PINOUT.md`).
3. **Sockets & Headers:**
   - Solder DIP sockets for U1 (DIP-40), U2 (DIP-14), U3 (DIP-16), and U4 (DIP-28). DIP socket for Y1 (DIP-8) is optional but convenient.
   - Solder the 34-pin dual-row floppy header (J2).
4. **Electrolytic Capacitor & Oscillator:**
   - Radial capacitor C6 (22µF, observe polarity: negative stripe to ground).
   - 16 MHz crystal oscillator Y1.
5. **Clean the Board:**
   - Clean flux residue with isopropyl alcohol (IPA). Ensure the 50-pin cartridge slot gold fingers are completely clean.

---

## Pre-Power Checks

1. **Continuity & Short Check:**
   - With all sockets empty, measure resistance between +5V (pin 45/47 on MSX slot) and GND (pins 41/43).
   - Verify there are no shorts across power rails.
2. **Dry Fit Test (No ICs installed):**
   - Insert the unpopulated board into the MSX cartridge slot.
   - Power on the MSX. The machine should boot normally into standard MSX BASIC without any freeze or glitch. If it does not boot, check the cartridge connector alignment and inspect for solder bridges.

---

## Incremental Smoke Tests & Verification

Rather than installing all ICs at once, the board can be tested in stages to isolate any faulty logic or controller chips:

### Step 1: Memory & Slot Decoding Test (Smoke Test with Game ROM)
Before burning and running the disk controller ROM, you can verify that the cartridge slot addressing and ROM socket (U4) work correctly:
- Burn a simple 16KB or 32KB MSX cartridge game (e.g. *Antarctic Adventure* or similar standard cartridge ROM) into an EEPROM/EPROM.
- Insert the test ROM into socket U4 (with U1, U2, U3 left empty).
- Insert the cartridge into the MSX and power on.
- The game should launch and run normally. This confirms that the cartridge edge connections, address lines, and the ROM socket wiring are completely sound.

### Step 2: Oscillator & Clock Verification
- Remove the test ROM. Install the 74LS04 (U2) and ensure the 16 MHz oscillator (Y1) is powered.
- With an oscilloscope or frequency counter, probe the clock input / inverter output to verify a steady 16 MHz clock is present.

### Step 3: Disk ROM Installation
- Program a 27C512 / W27C512 with `rom/TDC600EN.ROM`.
- Place U4 (programmed ROM) and the logic ICs (U2: 74LS04, U3: 74LS138) in their sockets.
- Without the WD37C65 installed, powering on the MSX should initialize the Disk BIOS hook: the MSX will display the boot screen, delay slightly while checking for disk hardware, or wait for controller response.

### Step 4: Installing the Floppy Controller (WD37C65)
- Insert U1 (WD37C65) into its DIP-40 socket, observing pin 1 orientation.
- Power on the MSX without a drive connected: the MSX should boot past the logo into MSX Disk BASIC (showing Disk BASIC version text).
- Connect your 34-pin floppy drive or configured Gotek emulator.
- Insert an MSX-DOS disk or DSK image. Power on or reset; the drive LED will blink and the MSX should boot into MSX-DOS.

---

## Troubleshooting

| Symptom | Probable Cause & Check |
| :--- | :--- |
| MSX boots straight to regular BASIC without disk message | Check U4 (Disk ROM) or U3 (74LS138 decoder). ROM might be blank, misaligned, or poorly seated. |
| Computer hangs indefinitely on MSX logo screen | Usually indicates a faulty or counterfeit WD37C65 (U1), defective 74LS04 (U2), or bad 16 MHz clock signal from Y1. |
| Drive motor stays constantly on / LED permanently lit | Ribbon cable is reversed (pin 1 orientation mismatch on either J2 or the drive). |
| "Disk offline" or drive not responding to commands | Check 34-pin cable continuity, drive select jumpers (DS0 vs DS1), and verify the drive has steady +5V power. |
