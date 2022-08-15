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
         ] 

