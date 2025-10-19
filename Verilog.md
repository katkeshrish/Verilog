Digital Logic Design Projects (Verilog HDL)
Welcome to this repository, which hosts a collection of Digital Logic Design (DLD) projects implemented using the Verilog Hardware Description Language (HDL).
These projects cover various fundamental and advanced topics in digital electronics, including Finite State Machines (FSMs), combinational logic, sequential circuits, and more.
 Project Structure
Each Verilog file (.v) in this repository is designed to be self-contained and ready for simulation.
•	Single-File Design: Every file contains both the main hardware module (the RTL code) and its corresponding verification module (the Testbench).
•	Naming Convention: Files are named descriptively after the primary hardware component they implement (e.g., FSM.v, ArithmeticUnit.v).
 Getting Started
Prerequisites
To run and simulate these designs, you will need access to a Verilog simulator and a waveform viewer. Recommended tools include:
•	Icarus Verilog (iverilog): Free and open-source simulator.
•	GTKWave: Waveform viewer for analyzing simulation results.
•	ModelSim / QuestaSim: Industry-standard commercial simulators.
Simulation Steps (Using Icarus Verilog)
Follow these steps to quickly compile and run a simulation for any file (e.g., FSM.v):
1.	Compile the Verilog file: Since the RTL and Testbench are in one file, you only need to compile that single file.
2.	iverilog -o project_sim_name <filename.v>
(e.g., iverilog -o fsm_sim FSM.v)
3.	Run the simulation: This command executes the testbench code and typically generates a Value Change Dump (.vcd) file, which contains the signal traces.
4.	vvp project_sim_name
(e.g., vvp fsm_sim)
5.	View the waveform results (optional): Use GTKWave to open the generated .vcd file (often named dump.vcd by default, or as specified in the testbench) for graphical analysis.
6.	gtkwave dump.vcd

