; windows AutoHotKey files - Jesse Jurman 

; Map Win-Left-Click to copying the current color to the clipboard
#LButton::
MouseGetPos, out_x, out_y
PixelGetColor, clipboard, out_x, out_y, RGB
TrayTip, ,clipboard: %clipboard%
return

; map 'a to send-prefix in cygwin
$'::
if WinActive("-bash")
{
  Input, user_in, L1 T0.3 I
  if user_in = a
  {
    send, ^b
    return
  }
  else
  {
    send, '%user_in%
  }
  return
}
else
{
  send, '
}
return

; Ctrl+b yells at you if in cygwin, otherwise just send Ctrl+b
$^b::
if WinActive("-bash")
{
  TrayTip,, "Uh uh uh! You didn't say the magic word!", 0
  SetTimer, RemoveTrayTip, 2000
}
else
{
  send, ^b
}
return

; Cut the TrayTip off sooner
RemoveTrayTip:
SetTimer, RemoveTrayTip, Off
TrayTip
return
