# VHDL-Serial-to-Parallel# VHDL Serial-to-Parallel Converter with Pattern Detection

This project implements a **Serial-to-Parallel Converter** in VHDL.  
The design receives 8 bits serially on a single input and outputs them in parallel, along with control signals for validity and pattern detection.

---

## Entity: SerialToParallel

### Ports

| Port    | Direction | Description |
|---------|-----------|-------------|
| Reset   | input     | Asynchronous reset |
| Clk     | input     | Clock signal |
| DataIn  | input     | Serial data input |
| Start   | input     | Start signal for serial-to-parallel conversion |
| Pattern | input     | 8-bit pattern to detect |
| DataOut | output    | 8-bit parallel output |
| Valid   | output    | High when 8 bits have been received |
| Found   | output    | High if received 8-bit data matches Pattern |

---

## Functionality

- When `Start = '1'`, the converter begins capturing serial bits.  
- After 8 clock cycles, the 8-bit serial input is available on `DataOut`.  
- `Valid` is set to `'1'` for one clock cycle after the 8 bits are received.  
- If the received 8-bit data matches `Pattern`, `Found` is set to `'1'`; otherwise `'0'`.

---

## Architecture

- A **shift register** (`ShiftReg`) stores incoming bits.  
- `BitCount` keeps track of how many bits have been received.  
- `Active` flag indicates ongoing conversion.  
- `Valid` and `Found` are generated based on the number of bits received and pattern comparison.  

---

## Example Usage

Instantiate the `SerialToParallel` entity in a testbench and apply serial data to `DataIn`, toggle `Start`, and observe `DataOut`, `Valid`, and `Found`.

```vhdl
-- Example in a testbench
Start <= '1';
DataIn <= "10101010"; -- send bit by bit on each clock
# VHDL Serial-to-Parallel Converter with Pattern Detection

This project implements a **Serial-to-Parallel Converter** in VHDL.  
The design receives 8 bits serially on a single input and outputs them in parallel, along with control signals for validity and pattern detection.

---

## Entity: SerialToParallel

### Ports

| Port    | Direction | Description |
|---------|-----------|-------------|
| Reset   | input     | Asynchronous reset |
| Clk     | input     | Clock signal |
| DataIn  | input     | Serial data input |
| Start   | input     | Start signal for serial-to-parallel conversion |
| Pattern | input     | 8-bit pattern to detect |
| DataOut | output    | 8-bit parallel output |
| Valid   | output    | High when 8 bits have been received |
| Found   | output    | High if received 8-bit data matches Pattern |

---

## Functionality

- When `Start = '1'`, the converter begins capturing serial bits.  
- After 8 clock cycles, the 8-bit serial input is available on `DataOut`.  
- `Valid` is set to `'1'` for one clock cycle after the 8 bits are received.  
- If the received 8-bit data matches `Pattern`, `Found` is set to `'1'`; otherwise `'0'`.

---

## Architecture

- A **shift register** (`ShiftReg`) stores incoming bits.  
- `BitCount` keeps track of how many bits have been received.  
- `Active` flag indicates ongoing conversion.  
- `Valid` and `Found` are generated based on the number of bits received and pattern comparison.  

---

## Example Usage

Instantiate the `SerialToParallel` entity in a testbench and apply serial data to `DataIn`, toggle `Start`, and observe `DataOut`, `Valid`, and `Found`.

```vhdl
-- Example in a testbench
Start <= '1';
DataIn <= "10101010"; -- send bit by bit on each clock
