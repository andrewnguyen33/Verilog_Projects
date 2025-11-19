# Verilog_Projects

A collection of Verilog hardware designs developed for computer engineering coursework, including an ALU, register file, logic blocks, processor datapath, and processor components, eventually culminating in the creation of a fully functional RISC-V RV32I single-cycle CPU in Verilog. The processor follows the classic single-cycle datapath architecture, where each instruction (arithmetic, logical, memory access, or control flow) executes in exactly one clock cycle. The design is composed of modular hardware blocks—ALU, register file, instruction memory, control logic, immediate generator, and data memory—connected through a clean and well-defined datapath. A comprehensive testbench verifies correct operation across core RISC-V instructions, including ADD, SUB, AND, OR, SLT, LW, SW, BEQ, BNE, and JAL.

## How It's Made:

This project was built by designing each component of the RISC-V processor individually and then integrating them into a complete single-cycle architecture. Each hardware block was implemented, tested, and validated before being assembled into the final datapath. Key stages of development include:

1. Core Building Blocks

ALU (Arithmetic Logic Unit): Implements arithmetic and logical operations required by the RV32I instruction set (ADD, SUB, AND, OR, SLT, etc.).

Register File: Contains 32 registers, supports two reads and one write per cycle, and properly enforces x0 as a constant zero.

Immediate Generator: Decodes instruction fields and produces the correct signed immediate for R-type, I-type, S-type, B-type, and J-type instructions.

Control Unit: Generates the control signals needed to route data through the datapath, select ALU operations, control memory access, and handle branching.

2. Memory & Instruction Handling

Instruction Memory: Stores the program being executed, feeding instructions into the datapath every cycle.

Data Memory: Supports load (LW) and store (SW) operations, interfaced through the ALU’s computed address.

3. Datapath Construction

After each module was validated individually, they were connected into a full single-cycle datapath consisting of:

Program Counter (PC)

Instruction Fetch

Register Reads

ALU Execution

Memory Access

Write-Back Stage

Branch and PC-update logic

This architecture ensures that every instruction completes in exactly one clock cycle, mirroring the classic RISC-V educational design.

4. Testing and Verification

A comprehensive Verilog testbench was created to:

Simulate instruction sequences

Verify correctness of register writes

Validate memory interactions

Confirm proper handling of branches and jumps

Inspect intermediate datapath signals for debugging

Waveforms (through tools like ModelSim or GTKWave) were used extensively to confirm cycle-accurate behavior.

## Lessons Learned:

Through this project, I gained hands-on experience programming in the Verilog hardware description language, learning how to model digital circuits at both the module and system levels. I learned how to design core processor components—including ALUs, register files, memory blocks, and control logic—and how to integrate these modules into a fully functional RISC-V single-cycle processor.

Working through each subsystem taught me how to build hardware incrementally: implementing, verifying, and refining individual components before combining them into a complete machine. I also developed strong debugging skills using testbenches and waveform analysis, allowing me to trace signal behavior cycle-by-cycle and confirm correct execution of instructions.

Overall, this project strengthened my understanding of computer architecture, digital logic design, hardware modularity, and verification workflows used in real hardware development.


