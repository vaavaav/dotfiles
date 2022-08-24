import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Actions.CopyWindow

myTerminal = "alacritty"

---

main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp . (`additionalKeysP` myKeys) $ myConfig 

myConfig = def
    { terminal = myTerminal 
    , modMask = mod4Mask
    , normalBorderColor = "#cccccc"
    }

myKeys = [ ("M-<Return>", spawn myTerminal)
	 , ("M-d", spawn "rofi -show drun")
         , ("M-S-q", kill1)
	 , ("<Print>", spawn "flameshot gui")
	 , ("<XF86AudioLowerVolume>", spawn "amixer -q sset Master 5%-")
	 , ("<XF86AudioRaiseVolume>", spawn "amixer -q sset Master 5%+")
	 , ("<XF86AudioMute>", spawn "amixer set Master toggle")
	 , ("<XF86MonBrightnessUp>", spawn "brightnessctl set +10%")
	 , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 10%-")
	 , ("<XF86AudioMicMute>", spawn "amixer set Capture toggle")

         ] 

