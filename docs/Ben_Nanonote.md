
== Overview ==

* [http://en.ingenic.cn/product.aspx?ID=60 JZ4720] 336 MHz MIPS compatible processor from [http://www.ingenic.cn Ingenic Semiconductor Co.]

* 3.0" 320x240 pixels [[LCD|colour TFT LCD]] (40x15 character in a text console)

* 32MB [[SDRAM]] 

* 2GB [[NAND|NAND Flash]] Memory

* 1 [[SD|microSDHC]] slot (SDIO capable)

* 59 keys Keyboard

* Stereo headphones connector, mono speaker and microphone [[Audio_IN_OUT|audio interfaces]].

* [http://wiki.qi-hardware.com/wiki/USB_host USB] 2.0 High-Speed Device, [http://en.wikipedia.org/wiki/USB#Connector_types Mini B] connector

* 3.7V 850mAh Li-ion Battery ( [[Compatible_batteries|Compatible batteries]]) and 5V 500mA [[Power_Supply_Circuit|DC input through USB port]]

* Measured battery life time, idle, screen off: 12h59

* Overall dimension (lid closed): 99 * 75 * 17.5mm. (display: 7.5mm, keyboard: 10mm)

* Weight: 126g (includes battery)

== Status ==

* Flashing bootloader, kernel, and rootfs via USB works.
* Serial console via GND/RXD/TXD pads under the battery works.
* LCD works
** After a few minutes of inactivity on the console, it will go blank. Pressing any key brings it back.
* Keyboard works
* Audio/ALSA works.
* ...

== Pinouts ==

PCB 08.50 (ben)

'''Micro-SD pins on testpads:'''

 Pin  TP     note
 ------------------
 #1   TP14   data2
 #2   TP15   cd/data3 / _CS
 #3   TP17   cmd / mosi
 #4   sdVCC  switched by Q4 (fet?) controlled via line from cpu (on TP11)
 #5   TP16   clock
 #6   GND
 #7   TP12   data0 / miso
 #8   TP13   data1

'''Serial pins:'''

See [[Ben_source_code#serial_console]].

== System information ==

 $ '''cat /proc/cpuinfo'''
 system type             : JZ4740
 processor               : 0
 cpu model               : Ingenic JZRISC V4.15
 BogoMIPS                : 335.05
 wait instruction        : yes                                                   
 microsecond timers      : no                                                    
 tlb_entries             : 32                                                    
 extra interrupt vector  : yes                                                   
 hardware watchpoint     : yes, count: 1, address/irw mask: [0x0fff]             
 ASEs implemented        :                                                       
 shadow register sets    : 1                                                     
 core                    : 0                                                     
 VCED exceptions         : not available                                         
 VCEI exceptions         : not available                                         

 $ '''cat /proc/mtd'''
 dev:    size   erasesize  name
 mtd0: 00400000 00080000 "NAND BOOT partition"
 mtd1: 00400000 00080000 "NAND KERNEL partition"
 mtd2: 20000000 00080000 "NAND ROOTFS partition"
 mtd3: 5f800000 00080000 "NAND DATA partition"

 $ '''uname -a'''
 Linux BenNanoNote 2.6.32.27 #1 PREEMPT Sat Mar 5 03:54:50 MSK 2011 mips GNU/Linux

 $ '''cat /proc/iomem'''
 00000000-01ffffff : System RAM
   00010000-0031162b : Kernel code
   0031162c-0040877f : Kernel data
 10003000-10003037 : jz4740-rtc
   10003000-10003037 : jz4740-rtc
 10020000-10020037 : jz4740-i2s
   10020000-10020037 : jz4740-i2s
 10020080-10020087 : jz4740-codec
   10020080-10020087 : jz4740-codec
 10021000-10030fff : jz4740-mmc.0
   10021000-10030fff : jz4740-mmc
 10070000-10070030 : jz4740-adc
   10070000-10070030 : jz4740-adc
 13010000-1301ffff : jz4740-nand.0
   13010000-1301ffff : jz4740-nand
 13030000-1303ffff : jz-ohci.0
 13040000-1304ffff : jz-udc
   13040000-1304ffff : jz-udc
 13050000-1305ffff : jz4740-fb
   13050000-1305ffff : jz4740-fb

 $ '''cat /proc/interrupts'''
           CPU0       
   2:      33611            MIPS  JZ4740 cascade interrupt
  17:         20            INTC  serial
  20:         56            INTC  jz4740-adc
  22:         47            INTC  MMC/SD
  23:          0            INTC  jz4740-rtc
  28:          0            INTC  DMA
  31:      32374            INTC  jz4740-timerirq
  32:        527            INTC  jz-udc
 147:          0     GPIO Bank C  jz4740-battery
 152:          0     GPIO Bank D  MMC/SD detect changed
 170:          0     GPIO Bank D  matrix-keypad
 171:         94     GPIO Bank D  matrix-keypad
 172:         77     GPIO Bank D  matrix-keypad
 173:         17     GPIO Bank D  matrix-keypad
 174:        151     GPIO Bank D  matrix-keypad
 175:         13     GPIO Bank D  matrix-keypad
 176:        235     GPIO Bank D  matrix-keypad
 178:          0     GPIO Bank D  matrix-keypad
 180:          0     GPIO Bank D  gpio-charger.0
 181:          0     GPIO Bank D  Power
 ERR:          0

== GPIO pins ==

The Jz4720 has only a limited number of pins as outputs to the board.  Furthermore, several functions take up gpio pins which are therefore not usable for other functions.  Those devices are the sdram and nand controller, lcd controller and mmc+sd controller.  Below is a table showing how they are used.  Please complete this table.  The missing entries are not connected to a pad in the Jz4720.

'''Port A:'''
* 01      sdram data 0
* 03      sdram data 1
* 05      sdram data 2
* 07      sdram data 3
* 08      sdram data 4
* 09      sdram data 5
* 10      sdram data 6
* 11      sdram data 7
* 12      sdram data 8
* 13      sdram data 9
* 15      sdram data 10
* 17      sdram data 11
* 22      sdram data 12
* 26      sdram data 13
* 28      sdram data 14
* 30      sdram data 15

'''Port B:'''
* 00      sdram address 0
* 01      sdram address 1
* 02      sdram address 2
* 03      sdram address 3
* 04      sdram address 4
* 05      sdram address 5
* 06      sdram address 6
* 07      sdram address 7
* 08      sdram address 8
* 09      sdram address 9
* 10      sdram address 10
* 11      sdram address 11
* 12      sdram address 12
* 13      sdram address 13
* 14      sdram address 14
* 15      nand command latch
* 16      nand address latch
* 17      not connected (was marked "SHDN_HOST???", but schematic disagrees)
* 18      TP23 (free)
* 19      sdram dcs
* 20      sdram ras
* 21      sdram cas
* 22      sdram write enable
* 23      sdram cke
* 24      sdram cko
* 25      sdram cs1
* 26      sdram cs2
* 27      not connected (was marked "USB ID", but schematic disagrees)
* 28      not connected
* 29      Audio output enable (anti-pop control)
* 30      TP25 (free)
* 31      sdram write enable 0

'''Port C:'''
* 00      lcd data 0
* 01      lcd data 1
* 02      lcd data 2
* 03      lcd data 3
* 04      lcd data 4
* 05      lcd data 5
* 06      lcd data 6
* 07      lcd data 7
* 08      TP 35 (free)
* 09      TP 36 (free)
* 10      keyboard out 1, TP59
* 11      keyboard out 2, TP60
* 12      keyboard out 3, TP61
* 13      keyboard out 4, TP62
* 14      keyboard out 5, TP63
* 15      keyboard out 6, TP64
* 16      keyboard out 7, TP65
* 17      keyboard out 8, TP66
* 18      lcd pixel clock
* 19      lcd hsync
* 20      lcd vsync
* 21      lcd SPI chipselect
* 22      lcd SPI data
* 23      lcd SPI clock
* 24      sdram write enable 1
* 27      Charge detect (analog input to read battery voltage).
* 28      nand read enable
* 29      nand write enable
* 30      nand flash ready/busy
* 31      not connected to a pad; PCSEL31 selects jtag (PCSEL31==0) or uart0 (PCSEL31==1) on pad 147(TxD)+148(RxD) (TP5+TP4).

'''Port D:'''
* 00      SD Card detect
* 02      SD Card power enable
* 04      Speaker AMP enable (no audio unless this output is pulled low).
* 06      Low power indicator (if 0, battery power is low).
* 08      SD Card command
* 09      SD Card clock
* 10      SD Card data 1
* 11      SD Card data 2
* 12      SD Card data 3
* 13      SD Card data 4
* 15      TP 38 (free)
* 18      Keyboard in 1, TP67
* 19      Keyboard in 2, TP68
* 20      Keyboard in 3, TP69
* 21      Keyboard in 4, TP70
* 22      Keyboard in 5, TP71
* 23      Keyboard in 6, TP72
* 24      Keyboard in 7, TP73
* 25      uart0 transmit, TP75
* 26      Keyboard in 8 (uart0 receive), TP74
* 27      Buzzer, controlled with pwm4.  Piezo-electric buzzer; not related to soundcard output.
* 28      USB detect (0 if usb power is present).
* 29      power button (0 if pressed).

=== Sorted by function ===
* buzzer: D27
* audio: B29, D4
* power button: D29
* keyboard: C10, C11, C12, C13, C14, C15, C16, C17, D18, D19, D20, D21, D22, D23, D24, D26(also uart receive)
* uart: C31, D25, D26(also keyboard), uart is also available on jtag pads TP4+TP5 (without gpio overload).
* sd/mmc: D0, D2, D8, D9, D10, D11, D12, D13
* usb: D28
* battery: C27, D6
* sdram: A1, A3, A5, A7, A8, A9, A10, A11, A12, A13, A15, A17, A22, A26, A28, A30, B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B19, B10, B21, B22, B23, B24, B25, B26, B31, C24
* nand: B15, B16, C28, C29, C30
* lcd: C0, C1, C2, C3, C4, C5, C6, C7, C18, C19, C20, C21, C22, C23
* only test points: B18, B30, C8, C9, D15
* unconnected pads: B17, B27, B28

[[Category:Ben NanoNote]]

This content is dual licensed under CC-BY-SA and GFDL and was obtained from [http://en.qi-hardware.com/wiki/Hardware-Ben](http://en.qi-hardware.com/wiki/Hardware-Ben)
