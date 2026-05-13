------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "desc:Microstep MSI G27CQ4 E2",
    mode = "2560x1440@165Hz",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "desc:Samsung Electric Company LF24T370F HNAW200019",
    mode = "1920x1080@60Hz",
    position = "2560x0",
    scale = "1",
    transform = 3,
    disabled = true,
})

---------------------------------
---- AUTOSTART & ENVIRONMENT ----
---------------------------------

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

---------------
---- INPUT ----
---------------

hl.config({
    cursor = {
        no_hardware_cursors = true,
        default_monitor = "DP-3",
    },

    input = {
        kb_layout = "us,cz",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = -0.7, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(
    "SUPER + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
