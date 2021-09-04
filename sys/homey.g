; homey.g
; Called to home the Y axis
;
; generated by RepRapFirmware Configuration Tool v3.2.3 on Sun May 23 2021 18:55:04 GMT+0200 (Mitteleuropäische Sommerzeit)
; Tweaked by Agar Sept 2021
; Largely copied from https://github.com/3dprintingworld/MULDEX/blob/master/Firmware/sys/homey.g
; discovered from https://forum.duet3d.com/topic/17408/dual-y-axis-endstop-homing/24
G91                           ; relative positioning
G1 H1 Y-1025 F1500            ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000                   ; go back a few mm

; Instead of just doing this...
;G1 H1 Y-10 F360               ; move slowly to Y axis endstop once more (second pass)
; ... do this.
; Remember, config.g has this
;   Drives
;     M584 X3 Y2:1 Z0                  ; set drive mapping, 2 is Y-l, 1 is Y-r
;   Endstops
;     M574 Y1 S1 P"!ystop+!e0stop"     ; configure active-low endstops for low end on Y via ystop for physical drive 2 Left and pin e0stop for physical drive 1 Right
M584 Y2                       ; Drive Y-l side motor 2 only when commanding movements along the y axis
M574 Y1 S1 P"!ystop"          ; Y-l endstop Active, note Y1 here means Drive Y, the active endstop is at the low end of the axis
G1 H1 Y-10 F360               ; move slowly to Y-l endstop once more (second pass)
M584 Y1                       ; Drive Y-r side motor 2 only when commanding movements along the y axis
M574 Y1 S1 P"!e0stop"         ; Y-r endstop Active, note Y1 here means Drive Y, the active endstop is at the low end of the axis
G1 H1 Y-10 F360               ; move slowly to Y-r endstop once more (second pass)
M584 Y2:1                     ; Combine Y-Axis motors again
M574 Y1 S1 P"!ystop+!e0stop"  ; Y Double active-low endstops for axis low end
; End of changes.

G1 Y5 F6000                   ; go back a few mm
G90                           ; absolute positioning
