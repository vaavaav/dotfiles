{
  programs.xmobar = {
    enable = true;
    extraConfig = ''

      Config { overrideRedirect = False
       , font     = "xft:iosevka-12,Font Awesome 5 Free"
       , bgColor  = "#000000"
       , fgColor  = "#f5f5f5"
       , position = TopSize L 100 40 
       , commands = [ Run Weather "EGPF"
                        [ "--template", "<weather> <tempC>°C"
                        , "-L", "0"
                        , "-H", "25"
                        , "--low"   , "lightblue"
                        , "--normal", "#f8f8f2"
                        , "--high"  , "red"
                        ] 36000
                    , Run Cpu
                        [ "-L", "3"
                        , "-H", "50"
                        , "--high"  , "red"
                        , "--normal", "green"
                        ] 10
                    , Run Battery [
                        "-t", "<acstatus>: <left>% - <timeleft>",
               "--",
               --"-c", "charge_full",
               "-O", "AC",
               "-o", "Bat",
               "-h", "green",
               "-l", "red"
                        ] 10
                    , Run Alsa "default" "Master"
                        [ "--template", "<volumestatus>"
                        , "--suffix"  , "True"
                        , "--"
                        , "--on", ""
                        ]
                    , Run Memory ["--template", "Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run Date " %a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
                    , Run XMonadLog
                    ]
       , sepChar  = "%"
       , alignSep = "}{"
       , template = "%XMonadLog% }{ %alsa:default:Master% | %battery% | %cpu% | %memory% * %swap% | %EGPF% | %date% "
       }
    '';
  };
}
