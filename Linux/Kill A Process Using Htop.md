---
title: Kill A Process Using htop
updated: 2024-12-06 22:11:34Z
created: 2024-11-02 22:08:33Z
latitude: 50.89031200
longitude: -1.02875100
altitude: 0.0000
---


#### 1. Kill a process using htop 
Use the arrow keys to highlite the process you want to remove  
and then press either **F9** or **k** then select which signal  
you want to send in the list (using the arrow keys) and press enter.  
Then use:  
`3 SIGQUIT` to politely quit the process  
or  
`9 SIGKILL` to force quit the process

#### 2. Kill a process via terminal  
use htop to find the process PID. The exit htop with `q`  
Open terminal and enter `kill PID` or `sudo kill PID`  
replace **PID** with actual number e.g. `kill 3043`

![htop](../_resources/htop)

#### 3. Press F6 which is the `sort by` option.

Then, under the "sort by" category on the left, select option PID  
and then press Enter. This should give you a more stable output.

Next, to locate a process, press F3 to search, type in the search  
and then press F3 again to scroll through search results.

When the process is highlighted, press F9 two times quickly  
and then press 9 and then press Enter to kill the process