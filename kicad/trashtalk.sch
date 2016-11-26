EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:arduino
LIBS:dfplayer
LIBS:amp
LIBS:trashtalk-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ARDUINO_PRO_MINI_5V U1
U 1 1 581F9EB4
P 3900 3450
F 0 "U1" H 4400 4250 60  0000 C CNN
F 1 "ARDUINO_PRO_MINI_5V" H 3950 4400 60  0000 C CNN
F 2 "" H 3900 3450 60  0000 C CNN
F 3 "" H 3900 3450 60  0000 C CNN
	1    3900 3450
	-1   0    0    1   
$EndComp
$Comp
L DFPlayer_Mini U2
U 1 1 581F9FD6
P 6150 4050
F 0 "U2" H 5800 3500 50  0000 C CNN
F 1 "DFPlayer_Mini" H 6000 3400 50  0000 C CNN
F 2 "" H 6050 4000 50  0000 C CNN
F 3 "" H 6050 4000 50  0000 C CNN
	1    6150 4050
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 581FA01C
P 5200 3850
F 0 "R1" V 5150 3650 50  0000 C CNN
F 1 "1K" V 5200 3850 50  0000 C CNN
F 2 "" V 5130 3850 50  0000 C CNN
F 3 "" H 5200 3850 50  0000 C CNN
	1    5200 3850
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 581FA0A1
P 5200 4000
F 0 "R2" V 5150 3800 50  0000 C CNN
F 1 "1K" V 5200 4000 50  0000 C CNN
F 2 "" V 5130 4000 50  0000 C CNN
F 3 "" H 5200 4000 50  0000 C CNN
	1    5200 4000
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 581FA13A
P 5550 3450
F 0 "#PWR?" H 5550 3300 50  0001 C CNN
F 1 "+5V" H 5550 3590 50  0000 C CNN
F 2 "" H 5550 3450 50  0000 C CNN
F 3 "" H 5550 3450 50  0000 C CNN
	1    5550 3450
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 581FA156
P 6150 3500
F 0 "C2" V 6100 3350 50  0000 L CNN
F 1 "C" V 6200 3350 50  0000 L CNN
F 2 "" H 6188 3350 50  0000 C CNN
F 3 "" H 6150 3500 50  0000 C CNN
	1    6150 3500
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 581FA1C4
P 5550 4550
F 0 "#PWR?" H 5550 4300 50  0001 C CNN
F 1 "GND" H 5550 4400 50  0000 C CNN
F 2 "" H 5550 4550 50  0000 C CNN
F 3 "" H 5550 4550 50  0000 C CNN
	1    5550 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 581FA1F5
P 6700 4550
F 0 "#PWR?" H 6700 4300 50  0001 C CNN
F 1 "GND" H 6700 4400 50  0000 C CNN
F 2 "" H 6700 4550 50  0000 C CNN
F 3 "" H 6700 4550 50  0000 C CNN
	1    6700 4550
	1    0    0    -1  
$EndComp
$Comp
L LM386MODULE U3
U 1 1 581FA350
P 4900 5900
F 0 "U3" H 4600 6350 50  0000 C CNN
F 1 "LM386MODULE" H 5250 5400 50  0000 C CNN
F 2 "TO220-9" H 4900 5900 50  0001 C CIN
F 3 "" H 4900 5900 50  0000 C CNN
	1    4900 5900
	1    0    0    -1  
$EndComp
$Comp
L SPEAKER SP1
U 1 1 581FA3F3
P 6150 5900
F 0 "SP1" H 6050 6150 50  0000 C CNN
F 1 "SPEAKER" H 6050 5650 50  0000 C CNN
F 2 "" H 6150 5900 50  0000 C CNN
F 3 "" H 6150 5900 50  0000 C CNN
	1    6150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3850 4750 3850
Wire Wire Line
	4750 3950 4950 3950
Wire Wire Line
	4950 3950 4950 4000
Wire Wire Line
	4950 4000 5050 4000
Wire Wire Line
	5650 3850 5350 3850
Wire Wire Line
	5350 4000 5500 4000
Wire Wire Line
	5500 4000 5500 3950
Wire Wire Line
	5500 3950 5650 3950
Wire Wire Line
	5550 3450 5550 3750
Wire Wire Line
	5550 3500 6000 3500
Wire Wire Line
	5550 3750 5650 3750
Connection ~ 5550 3500
Wire Wire Line
	5550 4350 5550 4550
Wire Wire Line
	6600 4350 6700 4350
Wire Wire Line
	6700 3500 6700 4550
Wire Wire Line
	6850 3750 6600 3750
Wire Wire Line
	5400 5650 5650 5650
Wire Wire Line
	5650 5650 5650 5800
Wire Wire Line
	5650 5800 5850 5800
Wire Wire Line
	5850 6000 5650 6000
Wire Wire Line
	5650 6000 5650 6150
Wire Wire Line
	5650 6150 5400 6150
$Comp
L +5V #PWR?
U 1 1 581FA4D1
P 4900 5250
F 0 "#PWR?" H 4900 5100 50  0001 C CNN
F 1 "+5V" H 4900 5390 50  0000 C CNN
F 2 "" H 4900 5250 50  0000 C CNN
F 3 "" H 4900 5250 50  0000 C CNN
	1    4900 5250
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 581FA4F3
P 5050 5300
F 0 "C3" V 4950 5400 50  0000 L CNN
F 1 "C" V 5100 5400 50  0000 L CNN
F 2 "" H 5088 5150 50  0000 C CNN
F 3 "" H 5050 5300 50  0000 C CNN
	1    5050 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 5250 4900 5350
Connection ~ 4900 5300
$Comp
L GND #PWR?
U 1 1 581FA57A
P 5350 5350
F 0 "#PWR?" H 5350 5100 50  0001 C CNN
F 1 "GND" H 5350 5200 50  0000 C CNN
F 2 "" H 5350 5350 50  0000 C CNN
F 3 "" H 5350 5350 50  0000 C CNN
	1    5350 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 581FA59E
P 4900 6550
F 0 "#PWR?" H 4900 6300 50  0001 C CNN
F 1 "GND" H 4900 6400 50  0000 C CNN
F 2 "" H 4900 6550 50  0000 C CNN
F 3 "" H 4900 6550 50  0000 C CNN
	1    4900 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6550 4900 6450
Wire Wire Line
	5350 5350 5350 5300
Wire Wire Line
	5350 5300 5200 5300
Wire Wire Line
	6300 3500 6700 3500
Connection ~ 6700 4350
$Comp
L GND #PWR?
U 1 1 581FB3CD
P 3450 2500
F 0 "#PWR?" H 3450 2250 50  0001 C CNN
F 1 "GND" H 3450 2350 50  0000 C CNN
F 2 "" H 3450 2500 50  0000 C CNN
F 3 "" H 3450 2500 50  0000 C CNN
	1    3450 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2200 3450 2500
Wire Wire Line
	3450 2350 3750 2350
Wire Wire Line
	3750 2350 3750 2500
$Comp
L +5V #PWR?
U 1 1 581FB41F
P 3850 2150
F 0 "#PWR?" H 3850 2000 50  0001 C CNN
F 1 "+5V" H 3850 2290 50  0000 C CNN
F 2 "" H 3850 2150 50  0000 C CNN
F 3 "" H 3850 2150 50  0000 C CNN
	1    3850 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2150 3850 2500
$Comp
L C C1
U 1 1 581FBB53
P 3650 2200
F 0 "C1" V 3600 2050 50  0000 L CNN
F 1 "C" V 3700 2050 50  0000 L CNN
F 2 "" H 3688 2050 50  0000 C CNN
F 3 "" H 3650 2200 50  0000 C CNN
	1    3650 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 2200 3850 2200
Wire Wire Line
	3500 2200 3450 2200
Connection ~ 3450 2350
Connection ~ 3850 2200
Wire Wire Line
	5650 4050 5500 4050
Wire Wire Line
	5500 4050 5500 4350
Wire Wire Line
	5500 4350 4400 4350
Wire Wire Line
	4400 4350 4400 5650
Wire Wire Line
	4400 6150 4400 6500
Wire Wire Line
	4400 6500 4900 6500
Connection ~ 4900 6500
$Comp
L R R3
U 1 1 581FC62F
P 4900 3000
F 0 "R3" V 4980 3000 50  0000 C CNN
F 1 "100R" V 4900 3000 50  0000 C CNN
F 2 "" V 4830 3000 50  0000 C CNN
F 3 "" H 4900 3000 50  0000 C CNN
	1    4900 3000
	-1   0    0    1   
$EndComp
$Comp
L LED D1
U 1 1 581FC672
P 5100 2600
F 0 "D1" V 5000 2400 50  0000 C CNN
F 1 "LED" V 5150 2400 50  0000 C CNN
F 2 "" H 5100 2600 50  0000 C CNN
F 3 "" H 5100 2600 50  0000 C CNN
	1    5100 2600
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 581FC831
P 1550 3550
F 0 "D1" V 1600 3800 50  0000 C CNN
F 1 "LASER" V 1500 3800 50  0000 C CNN
F 2 "" H 1550 3550 50  0000 C CNN
F 3 "" H 1550 3550 50  0000 C CNN
	1    1550 3550
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 581FC990
P 1550 2850
F 0 "#PWR?" H 1550 2700 50  0001 C CNN
F 1 "+5V" H 1550 2990 50  0000 C CNN
F 2 "" H 1550 2850 50  0000 C CNN
F 3 "" H 1550 2850 50  0000 C CNN
	1    1550 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 581FC9BC
P 1550 3850
F 0 "#PWR?" H 1550 3600 50  0001 C CNN
F 1 "GND" H 1550 3700 50  0000 C CNN
F 2 "" H 1550 3850 50  0000 C CNN
F 3 "" H 1550 3850 50  0000 C CNN
	1    1550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3850 1550 3750
Wire Wire Line
	1550 3350 1550 3250
Wire Wire Line
	5550 4350 5650 4350
Wire Wire Line
	4750 3750 5400 3750
Wire Wire Line
	4750 3350 4900 3350
Wire Wire Line
	5400 3750 5400 3150
Wire Wire Line
	5400 3150 6850 3150
Wire Wire Line
	6850 3150 6850 3750
Wire Wire Line
	4900 2600 4900 2850
Wire Wire Line
	4900 3350 4900 3150
Wire Wire Line
	5300 2600 5300 3650
Wire Wire Line
	5300 3650 4750 3650
$Comp
L R R4
U 1 1 58334706
P 1550 3100
F 0 "R4" H 1450 3150 50  0000 C CNN
F 1 "220" V 1550 3100 50  0000 C CNN
F 2 "" V 1480 3100 50  0000 C CNN
F 3 "" H 1550 3100 50  0000 C CNN
	1    1550 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2850 1550 2950
$EndSCHEMATC