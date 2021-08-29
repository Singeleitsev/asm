readme - Fast Design



Overview:

This design highlights the Dhrystone MIPS performance of the Nios II/f core. This system achieves over 150 DMIPS on the Cyclone III FPGA Development Kit, and can achieve over 190 DMIPS when targeting the fastest speed grade of a Cyclone III device.


Contents of the System:

 - Nios II/f Core
 - JTAG Debug Module (Level 1)
 - 64 Kbytes On-Chip RAM
 - JTAG UART
 - Timer
 - Avalon Memory-mapped Pipeline Bridge
 - PLL


System description:

- The pipeline bridge is used to connect the Nios II processor and various peripherals in the system. This eliminates separate arbiter logic for the slaves, thus increasing the system performance (fmax).

- The onchip RAM has dual port slaves which allow two masters to access the memory simultaneously. The slaves are pipelined and help in improving the system performance. Each of the slaves has a read latency of two.


Quartus II project settings:

- This design uses synthesis netlist and physical synthesis optimizations in Quartus II settings. For details, click on Settings under Assignments menu.


TimeQuest SDC constraint file:

- This design uses the TimeQuest Timing Analyzer. For details, refer to the niosII_cycloneIII_3c120_fast.sdc file located in the project directory.

 
Supported Software Examples:
 - Dhrystone
 - Hello World
 - Hello Free-Standing
 - Hello World Small

These software examples can be found in the software folder under the project directory. Run the create-this-app script in the software/app folder to create the corresponding software executable and linked file (elf).

These are the steps for running the Dhrystone software:
1. Open the Nios II 8.0 Command Shell.
2. Change directory to the project directory.
3. Program the configuration file (sof) to the board by typing nios2-configure-sof niosII_cycloneIII_3c120_fast.sof
4. Change directory to <project directory>/software/app/dhrystone
5. Run the create-this-app script by typing ./create-this-app
6. Download the elf file by typing nios2-download -g dhrystone.elf && nios2-terminal

These steps do apply to other software examples.


Note: If you wish to recompile the hardware design in Quartus II you will need to regenerate the system in SOPC Builder.