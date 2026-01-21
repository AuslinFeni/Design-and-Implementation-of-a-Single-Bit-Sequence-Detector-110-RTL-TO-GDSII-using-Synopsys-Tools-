# Design-and-Implementation-of-a-Single-Bit-Sequence-Detector-110-RTL-TO-GDSII-using-Synopsys-Tools-
This repository contains the complete RTL-to-GDSII implementation of a Sequence Detector for the binary pattern ‘110’ using Synopsys VLSI design tools. The project covers Verilog-based RTL design, functional verification, logic synthesis using Design Compiler, physical design using ICC2, and generation of layout (GDSII). 

The project begins with the creation of a Verilog RTL code that describes the sequence detector's functionality using finite state machine (FSM) principles. The RTL code undergoes functional verification through simulation tools such as VCS to ensure correct behavior. The verified RTL is then synthesized using Synopsys Design Compiler, translating the high-level design into a gate-level netlist optimized for timing, area, and power.

Post-synthesis, the design is imported into IC Compiler II, where the complete physical design process is performed. This includes floorplanning, power planning, placement, clock tree synthesis (CTS) and routing to meet foundry-specific requirements. Additionally, static timing analysis (STA) is conducted to verify timing closure, ensuring the design meets performance goals.

The final output is a GDSII file, which represents the mask layout for fabrication. This file is prepared with accurate layer mapping, ensuring compatibility with semiconductor manufacturing processes. The comprehensive flow leverages industry-standard EDA tools to achieve a high-quality, manufacturable design, demonstrating best practices in digital design implementation.

This project provides a practical demonstration of the complete VLSI design flow, offering insights into key steps such as synthesis, physical design, and verification, essential for real-world ASIC development.
