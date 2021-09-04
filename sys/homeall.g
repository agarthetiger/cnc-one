; homeall.g
; Called to home all axes
; Tweaked by Agar Sept 2021
G91                 ; relative positioning
G1 H1 Z200 F800     ; lift Z relative to current position until it hits the endstop
                    ; Z-Axis is homed

G1 H1 X-500 F1500   ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F6000         ; go back a few mm
G1 H1 X-10 F360     ; move slowly to X axis endstop once more (second pass)
G1 X5 F6000         ; go back a few mm

G1 H1 Y-1025 F1500            ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000                   ; go back a few mm
M584 Y2                       ; Drive Y-l side motor 2 only when commanding movements along the y axis
M574 Y1 S1 P"!ystop"          ; Y-l endstop Active, note Y1 here means Drive Y, the active endstop is at the low end of the axis
G1 H1 Y-10 F360               ; move slowly to Y-l endstop once more (second pass)
M584 Y1                       ; Drive Y-r side motor 2 only when commanding movements along the y axis
M574 Y1 S1 P"!e0stop"         ; Y-r endstop Active, note Y1 here means Drive Y, the active endstop is at the low end of the axis
G1 H1 Y-10 F360               ; move slowly to Y-r endstop once more (second pass)
M584 Y2:1                     ; Combine Y-Axis motors again
M574 Y1 S1 P"!ystop+!e0stop"  ; Y Double active-low endstops for axis low end
G1 Y5 F6000                   ; go back a few mm

G90                 ; absolute positioning
                    ; all axes are homed