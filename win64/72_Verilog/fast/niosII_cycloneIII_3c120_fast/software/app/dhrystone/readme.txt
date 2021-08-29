Description
-----------
This is the Dhrystone benchmark software version 2.1 which is intended to run on
the fast example design. You must change your data, read-only, and read-write memory 
to on-chip if you are running this on a hardware design other than the fast 
example design. These settings are located on the System Library project properties.

If you try to run this example on anything other than the fast example design 
targeting one of the Nios Stratix development boards, you will see different 
performance results or the example may not function properly due to lack of 
memory.

Requirements
------------
The Dhrystone software is intended to run on the fast reference designs which 
target the following boards (referred as Boards after this):

Cyclone III FPGA Development Kit
DSP Development Board, Stratix II Edition
Nios Development Board, Stratix II Edition
Nios Development Board, Stratix Professional Edition
Nios Development Board, Stratix Edition

Below are the changes to the default project settings that have been added to 
the create-this-app and create-this-bsp scripts in order to achieve
the performance mentioned above.

** In the create-this-app script:
- Set compiler flags -funsigned-char and -fno-inline
- Define symbol WANT_INLINE_STRCMP (available in the Preprocessor view)
- Set the optimization level to -O3
- Set debug level to -g1

** In the create-this-bsp script:
- Check "Reduced Device Drivers" 
- Set System clock timer to "none" 
- Set Timestamp timer to "timer"
- Set the optimization level to -O3
- Set debug level to -g1
- Set the custom newlib flags -funsigned-char and -fno-inline
- Set the custom newlib optimization level to -O2

A dhrystone application project with an associated library project with the 
above settings should fit with a little room to spare for the stack in the 64 KB
of program memory available in the fast example design.

The following modifications were made to the original Dhrystone code.
None of these modifications were to the timing loop of the
benchmark.
1) #ifdef HAVE_FULLIO was added around all file stream usage except printfs.
2) Because the the scanf is disabled by 1), a default number
of runs of 300,000 is set. Note: this can cause an overflow
in the counter if you are not running fast enough or compiled code.
3) The Too_Small_Time is changed from 2 to 0 seconds because
the timing we use is exact (clock cycle accurate).
4) timers_b.c has a Nios II version of dtime().
5) A bug in the original code had Reg_Define unsized, which
causes a buffer overflow. Therefore an initial size of 50 was set.
6) #include <string.h> was added to provide the declarations
for strcmp and strcpy.

Peripherals exercised by the software
-------------------------------------
JTAG UART
Timer

Description of software files
-----------------------------
dhry.h -  #define, #ifdef and typedef statements
dhry21a.c - main dhrystone loop and some functions called by the dhrystone loop
dhry21b.c - more functions called by the dhrystone loop
timers_b.c - routines for taking time measurements and converting the time
measurements

Board, Host machine requirements
--------------------------------
You must target one of the Boards with the fast example design running.

You must have a cable connected to the JTAG connector on the board to run
the dhrystone code and see the output in the terminal.

Known issues
------------
1. If you try to run this example on anything other than the fast example
design targeting one of the Boards, you will see different performance 
results or the example may not function properly due to lack of memory.

2. The stack will likely overflow if the optimization level is set to anything 
other than -O3.

3. Running the dhrystone example on the Nios II ISS will take a while to run.
Also, you will get optimistic performance results compared to running it in
hardware since the Nios II ISS is not cycle accurate.

4. If you try to run the dhrystone example on a hardware system other than the
fast example design, make sure that the program memory is set to on-chip 
memory (or other fast memory).
