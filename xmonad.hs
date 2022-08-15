import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myConfig 

myConfig = def
    { terminal = "alacritty"
    , modMask = mod4Mask
    , normalBorderColor = "#cccccc"
    }
