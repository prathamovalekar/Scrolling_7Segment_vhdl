# Scrolling_7Segment_vhdl
The program displays marching ”-” pattern from right to left and then from left to right, repeat
This pattern is displayed on the 8 7 segments of Nexus4DDR.

This project is carried out using Nexus4ddr. It has a system clock of 100mhz.
Using this system clock, a 500msec clock(shift) signal is generated.

2 vital signals :shift and direction are generated; these signals are utilised to generate enable signal "an" for the 8 seven segments.


