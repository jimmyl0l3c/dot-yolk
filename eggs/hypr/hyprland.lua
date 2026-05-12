------------------
---- MONITORS ----
------------------

local cfg = require("hypr_config")

hl.monitor({
    output = cfg.Monitors.Primary,
    mode = "2560x1440@165Hz",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = cfg.Monitors.Secondary,
    mode = "1920x1080@60Hz",
    position = "2560x0",
    scale = "1",
    transform = 3,
})

---------------------------------
---- AUTOSTART & ENVIRONMENT ----
---------------------------------

require("hypr_environment")

-----------------------
----- PERMISSIONS -----
-----------------------

-- TODO: check out the permissions
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("hypr_appearance")

---------------
---- INPUT ----
---------------

require("hypr_input")

---------------------
---- KEYBINDINGS ----
---------------------

require("hypr_keymaps")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("hypr_workspaces")
