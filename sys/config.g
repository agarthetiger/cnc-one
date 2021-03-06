; Configuration file for CNC ONE (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.2.3 on Sun May 23 2021 18:55:04 GMT+0200 (Mitteleuropäische Sommerzeit)
; Tweaked by Agar Sept 2021

; General preferences
G90                              ; send absolute coordinates...
M83                              ; ...but relative extruder moves
M550 P"Agars CNC ONE"            ; set printer name
M669 K0                          ; select Cartesian mode

; Network
M552 S1                          ; enable
M586 P0 S1                       ; enable HTTP
M586 P1 S0                       ; disable FTP
M586 P2 S0                       ; disable Telnet

; Drives
M584 X3 Y2:1 Z0                  ; set drive mapping
M569 P3 S0 R0 T5:5:10:0          ; physical drive 3 X Axis
M569 P2 S1 R0 T5:5:10:0          ; physical drive 2 Y Axis Left side
M569 P1 S1 R0 T5:5:10:0          ; physical drive 1 Y Axis Right side
M569 P0 S0 R0 T5:5:10:0          ; physical drive 0 Z Axis

M350 X16 Y16 Z16 I1              ; configure microstepping with interpolation
M92 X160.00 Y160.00 Z160.00      ; set steps per mm
M566 X100.00 Y100.00 Z100.00     ; set maximum instantaneous speed changes (mm/min)
M203 X12000.00 Y12000.00 Z12000.00 ; set maximum speeds (mm/min)
M201 X250.00 Y250.00 Z250.00     ; set accelerations (mm/s^2)
M906 X950 Y950 Z950 I30          ; set motor currents in mA and motor idle factor in per cent
M84 S30                          ; Set idle timeout

; Z-Probe
M558 P1 H50 F120 T6000 C"zprobe.in"
G31 P500 X0 Y0 Z26.5             ; Set Z probe trigger value, offset and trigger height

; Axis Limits
M208 X-5 Y-5 Z-2 S1              ; set axis minima
M208 X550 Y850 Z120 S0           ; set axis maxima, change this is using the dustshoe

; Endstops
M574 X1 S1 P"!xstop"             ; configure active-low endstop for low end on X via pin xstop
M574 Y1 S1 P"!ystop+!e0stop"     ; configure active-low endstops for low end on Y via ystop for physical drive 2 Left and pin e0stop for physical drive 1 Right
M574 Z2 S1 P"!zstop"             ; configure active-low endstop for high end on z via pin zstop

; Fans
M950 F0 C"fan0" Q500             ; create fan 0 on pin fan0 and set its frequency
M106 P0 S255 H-1                 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500             ; create fan 1 on pin fan1 and set its frequency
M106 P1 S255 H-1                 ; set fan 1 value. Thermostatic control is turned off
M950 F2 C"fan2" Q500             ; create fan 2 on pin fan2 and set its frequency
M106 P2 S0 H-1                   ; set fan 1 value. Thermostatic control is turned off
M950 F3 C"duex.fan3" Q500        ; create fan 3 on pin fan3 and set its frequency
M106 P3 S255 H-1                 ; set fan 1 value. Thermostatic control is turned off
M950 F4 C"duex.fan4" Q500        ; create fan 4 on pin fan4 and set its frequency
M106 P4 S0 H-1                   ; set fan 1 value. Thermostatic control is turned off

; Tools
M563 P0 D0 H1
G10 P0 X0 Y0 Z0
G10 P0 R0 S0

; Custom settings are not defined

; Miscellaneous
M575 P1 S1 B57600                ; enable support for PanelDue
M453 S0 C"spindle+spindleoff" R23000        ; switch to CNC-mode
