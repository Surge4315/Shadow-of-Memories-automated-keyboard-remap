#Requires AutoHotkey v2.0

SendMode("Input") ; apparently the most reliable for game stuff i guess

global remapEnabled := True

#HotIf WinActive("ahk_exe shadow.exe") and remapEnabled ;
{
w::Up 
s::Down 
a::Left
d::Right 
m::RShift ;map
f::RCtrl ;inventory
}
#HotIf ; end of If

F10:: global remapEnabled := !remapEnabled ;toggle remap on off