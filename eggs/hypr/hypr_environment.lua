-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- /usr/lib/polkit-kde-authentication-agent-1

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hyprpaper & hypridle & hyprsunset")
    hl.exec_cmd("/usr/bin/eww daemon & /usr/bin/eww open-many bar bar_right")
    hl.exec_cmd("hyprlauncher -d")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- QT_QPA_PLATFORMTHEME=qt5ct -- change to qt6ct if you have that

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "rose-pine")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")

hl.env("GTK_THEME", "Adwaita:dark")

hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WEBKIT_DISABLE_DMABUF_RENDERER", "1")
