@Echo off
cls
TITLE PendriveLocker by Mijki
@Echo SafetyFirst update V1.200 03-05-2022

:choice1
Echo list disk | diskpart
set /p SelDiskParam=Select the disk which you want to change:
goto :choice2

@Echo Read ONLY or Read And Write?
:choice2
cls
@Echo Now you will modify of Disk %SelDiskParam%
set /p c=Change to [R]ead Only or Read/[W]rite?
if /I "%c%" EQU "R" goto :read
if /I "%c%" EQU "W" goto :write


:read
(
Echo select disk %SelDiskParam%
Echo attributes disk set readonly
Echo attributes disk
) | diskpart
@Echo The changes were successful!
goto :final

:write
(
Echo select disk %SelDiskParam%
Echo attributes disk clear readonly
Echo attributes disk
) | diskpart

@Echo The changes were successful!
goto :final

:final
@Echo Do you want to make anymore changes?
set /p finalAnswer=Press [E]xit or [A]gain?
if /I "%finalAnswer%" EQU "E" exit
if /I "%finalAnswer%" EQU "A" goto :choice1