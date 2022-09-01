let mybar = "main"; in
{
  services.polybar = {
    enable = true;
    script = "polybar ${mybar} &";
    settings = {
      "colors" = {
        background = "#222222";
        background-alt = "#054950";
        foreground = "#ffffff"; 
        foreground-alt = "#ffffff";
        primary = "#29d398";
        secondary = "#e60053";
        alert = "#bd2c40";
      };

      "bar/${mybar}" = {
        width = "100%";
        height = 30;
        radius = "1.0";
        fixed-center = false;
        background = "\${colors.background}";
        foreground = "\${colors.foreground}";

        line-size = 2;
        line-color = "#fac29a";

        border-size = 4;
        border-color = "#00000000";

        padding-left = 0;
        padding-right = 1;

        module-margin-left = 0;
        module-margin-right = 1;

        font-0 = "iosevka:style=bold:size=12;3";
        font-1 = "Font Awesome 5 Free:pixelsize=12;2";
        font-2 = "Font Awesome 5 Free Solid:pixelsize=12;2";
        font-3 = "Font Awesome 5 Brands:pixelsize=12;2";

        modules-left = "i3"; 
        modules-center = "xwindow";
        modules-right = "pulseaudio sep xkeyboard sep memory cpu temperature battery sep wlan eth sep date";

        tray-position = "left";
        tray-padding = 2;

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
      };


      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:30:...%";
      };

      "module/sep" = {
        type = "custom/text";
        content = "|";
        content-foreground = "#555555";
      };

      "module/xkeyboard" = {
        type = "internal/xkeyboard";
        blacklist-0 = "num lock";

        format-prefix = " ";
        format-prefix-foreground = "\${colors.foreground-alt}";

        label-layout = "%layout%";

        label-indicator-padding = 2;
        label-indicator-margin = 1;
        label-indicator-background = "\${colors.secondary}";
      };


      "module/filesystem" = {
        type = "internal/fs";
        interval = 25;

        mount-0 = "/";

        label-mounted = " %percentage_used%%"; 
        label-unmounted = "%mountpoint% not mounted";
        label-unmounted-foreground = "\${colors.foreground-alt}";
      };

      "module/i3" = {
        type = "internal/i3";
        format = "<label-state> <label-mode>";
        index-sort = true;
        wrapping-scroll = false;

        label-mode-padding = 2;
        label-mode-foreground = "#000";
        label-mode-background = "\${colors.primary}";

     # focused = Active workspace on focused monitor
     label-focused = "%index%";
     label-focused-background = "\${colors.background-alt}";
     label-focused-underline= "#110000";
     label-focused-padding = 2;

     # unfocused = Inactive workspace on any monitor
     label-unfocused = "%index%";
     label-unfocused-padding = 2;

     # visible = Active workspace on unfocused monitor
     label-visible = "%index%";
     label-visible-background = "\${self.label-focused-background}";
     label-visible-underline = "\${self.label-focused-underline}";
     label-visible-padding = "\${self.label-focused-padding}";

     # urgent = Workspace with urgency hint set
     label-urgent = "%index%";
     label-urgent-background = "\${colors.alert}";
     label-urgent-padding = 2;

   };

   "module/cpu" = {
     type = "internal/cpu";
     interval = 2;
     format-prefix = " ";
     format-prefix-foreground = "\${colors.foreground-alt}";
     label = "%percentage:2%%";
   };

   "module/memory" = {
     type = "internal/memory";
     interval = 2;
     format-prefix = " ";
     format-prefix-foreground = "\${colors.foreground-alt}";
     label = "%percentage_used:2%%";
   };

   "module/wlan" = {
     type = "internal/network";
     interface = "wlp0s20f0u2";
     interval = "3.0";

     format-connected = "<label-connected> <ramp-signal>";
     label-connected = "%essid%";

     format-disconnected = "%{F#565656k}%{F-}";

     ramp-signal-0 = "%{F#D60000}%{F-}";
     ramp-signal-1 = "%{F#D4B401}%{F-}";
     ramp-signal-2 = "%{F#C4D600}%{F-}";
     ramp-signal-3 = "%{F#67BF16}%{F-}";
     ramp-signal-4 = "%{F#2ACF06}%{F-}";
   };



   "module/eth" = {
     type = "internal/network";
     interface = "enp0s31f6";
     interval = 3.0;

     format-connected-prefix = " ";
     format-connected-prefix-foreground = "\${colors.foreground-alt}";
     label-connected = "%local_ip%";
   };

   "module/date" = {
     type = "internal/date";
     interval = 5;

     date = " %a, %d-%m-%Y";
     date-alt = " %d-%m-%Y";

     time = "%H:%M";
     time-alt = "%H:%M";

     format-prefix = "";

     label = "%date% %time%";
   };

   "module/pulseaudio" = {
     type = "internal/alsa";

     format-volume = "<ramp-volume> <bar-volume>";
     label-volume = "%percentage%%";
     label-volume-foreground = "\${root.foreground}";

     label-muted = "";
     label-muted-foreground = "#666";

     ramp-volume-0 = "";
     ramp-volume-1 = "";
     ramp-volume-2 = "";

       # Only applies if <bar-volume> is used
       bar-volume-format = "%fill%%empty%";
       bar-volume-width = 9;
       bar-volume-gradient = true;

       bar-volume-indicator = "|";
       bar-volume-indicator-foreground = "\${color.foreground}";
       bar-volume-indicator-font = 2;

       bar-volume-fill = "|";
       bar-volume-fill-font = 2;
       bar-volume-foreground-0 = "#2ACF06";
       bar-volume-foreground-1 = "#2ACF06";
       bar-volume-foreground-2 = "#2ACF06";
       bar-volume-foreground-3 = "#67BF16";
       bar-volume-foreground-4 = "#67BF16";
       bar-volume-foreground-5 = "#67BF16";
       bar-volume-foreground-6 = "#C4D600";
       bar-volume-foreground-7 = "#D4B401";
       bar-volume-foreground-8 = "#D60000";

       bar-volume-empty = "|";
       bar-volume-empty-font = 2;
       bar-volume-empty-foreground = "#333333";
     };


     "module/battery" = {
       type = "internal/battery";
       battery = "BAT1";
       adapter = "AC";
       full-at = 98;

       format-charging = "<animation-charging> <label-charging>";

       format-discharging = "<ramp-capacity> <label-discharging>";

       format-full-prefix = " ";
       format-full-prefix-foreground = "\${colors.foreground-alt}";

       ramp-capacity-0 = "%{F#D60000}%{F-}";
       ramp-capacity-1 = "%{F#D4B401}%{F-}";
       ramp-capacity-2 = "%{F#C4D600}%{F-}";
       ramp-capacity-3 = "%{F#67BF16}%{F-}";
       ramp-capacity-4 = "%{F#2ACF06}%{F-}";

       animation-charging-0 = "";
       animation-charging-foreground = "#088F8F";
       animation-charging-framerate = 750;
     };

     "module/temperature" = {
       type = "internal/temperature";
       thermal-zone = 0;
       warn-temperature = 60;

       format = "<ramp> <label>";
       format-warn = "<ramp> <label-warn>";

       label = "%temperature-c%";
       label-warn = "%temperature-c%";
       label-warn-foreground = "\${colors.secondary}";


       ramp-0 = "%{F#08B3E5}%{F-}";
       ramp-1 = "%{F#14C9CB}%{F-}";
       ramp-2 = "%{F#14C9CB}%{F-}";
       ramp-3 = "%{F#2ACF06}%{F-}";
       ramp-4 = "%{F#2ACF06}%{F-}";
       ramp-5 = "%{F#2ACF06}%{F-}";
       ramp-6 = "%{F#2ACF06}%{F-}";
       ramp-7 = "%{F#67BF16}%{F-}";
       ramp-8 = "%{F#67BF16}%{F-}";
       ramp-9 = "%{F#D4B401}%{F-}";
       ramp-10 = "%{F#D60000}%{F-}";

       ramp-foreground = "\${colors.foreground-alt}";
     };


     "settings" = {
       screenchange-reload = true;
     };

     "global/wm" = {
       margin-top = 5;
       margin-bottom = 5;
     };

   };
 };
}
