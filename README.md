# CNC One modifications

This repo contains files which I've modified for my [CNC One](https://www.kickstarter.com/projects/cnc-one/cnc-one-kickstarters-easiest-and-most-powerful-cnc-ever).

## Disclaimer

These files are entirely unofficial Anything you find here is modified by me for my personal use. While I may use these files myself, I do so at my own risk and cannot make any claim that they are sufficiently well tested for my own use, let alone anyone elses. If you choose to use anything here you do so fully accepting the risk that these could cause a catastrophic failure to your machine, to yourself or anyone near your CNC One machine. Absolutely no warranty comes with these modifications. You must be prepared to read, diff and understand every modification made. You accept all liability and consequences arising from using these files. If you are in any way unsure about what you are doing you are strongly recommended to stick to the official files, procedures and updates provided by the awesome team at CNC One.

Right, with that said, on with the good stuff.

## Modifications

### CNCDuetPostProcessor

Initially surprisingly to me was that this file seemed easy to understand. I don't expect I'll keep this README updated with all the modifications. Initiall all I've looked to do was to adjust the defaults, and start and end movements. The main changes are

* Change the default file extension from `.gcode` to `.nc`.
* Change the default so that `Home axis on tool change` and `Probe tool on tool change` are disabled by default.
* Change the default so that `Manual tool change` is disabled by default.
* Comment out section for outputting M6 tool changes into the gcode.
* On finishing the program, fully retract on the Z axis then goto home on the X axis only.

Why have I made these changes?

These are all for convenience. I could have made all the changes in Fusion 360 or my manually reviewing and editing every g-code file Fusion 360 generates.

I use Visual Studio Code to view and edit my gcode files, and it seems more standard to use the `.nc` file extension, which VS Code picks up as a g-code file and applies syntax highlighting etc. I usually edit the files to remove unnecessary commands, often related to tool changes, which no machine I own supports.

When we power on the CNC One we have to home all the axis before the machine can be moved in any direction. Even though we have to automatic tool changing ability on this machine, tool selections are still output to the g code file which then causes a 2nd unnecessary homing. My personal workflow is to home the machine, then set the Work Offset (WCS G54) using a combination of the tool length sensor and dialling in the X-Y zero position for my part based on where I selected the origin to be in Fusion 360.

At the end of machining, industrial CNC machines will have their machine home position set to the top right rear corner of the working area by default. This means that homing all axis typically retracts the cutter as far away from the machine operator as possible, and allows maximum access to the part being machined. On the CNC One, home is the top front left corner of the machine, and moving this gantry mill to the front puts the X/Z axis right in the way of whatever I've just finished machining. Fully retracting the spindle on the Z axis first is safe and sensible. A subsequent move to X 0 should also be safe, assuming all workholding is below the Z retract height including the still rotating endmill, which should be a safe and sane assumption to make. As there is no default position for always placing the workpiece in the Y axis, I personally choose to leave it where it finishes. The front of the machine means I will always have to jog it backwards out of the way. Moving it to the back means that when I next home or power on my machine I'll have to traverse the full Y axis length to home to the front of the machine.
