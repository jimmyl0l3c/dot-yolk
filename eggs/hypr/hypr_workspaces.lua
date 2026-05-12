--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local cfg = require("hypr_config")

for i = 1, 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = cfg.Monitors.Primary,
        default = i == 1,
    })
end

for i = 6, 9 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = cfg.Monitors.Secondary,
    })
end

hl.workspace_rule({
    workspace = "10",
    monitor = cfg.Monitors.Primary,
})

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

-- Set default workspace of apps
hl.window_rule({ name = "firefox", workspace = "2", match = { class = "^firefox$" } })
hl.window_rule({
    name = "firefox-pip",
    workspace = "6",
    match = { class = "^firefox$", title = "^Picture-in-Picture$" },
})

hl.window_rule({ name = "zen", workspace = "2", match = { class = "^app.zen_browser.zen$" } })
hl.window_rule({
    name = "zen-pip",
    workspace = "6",
    match = { class = "^app.zen_browser.zen$", title = "^Picture-in-Picture$" },
})

hl.window_rule({ name = "heroic", workspace = "3", match = { class = "^heroic$" } })
hl.window_rule({ name = "discord", workspace = "6", match = { class = "^discord.*$" } })
hl.window_rule({ name = "cider", workspace = "7", match = { class = "^Cider$" } })

-- prevent steam notifications stealing focus by floating
hl.window_rule({
    name = "float-steam-notifications",
    float = true,
    match = { class = "^([Ss]team)$", title = "negative:[Ss]team$" },
})

hl.window_rule({
    name = "steam-client",
    tile = true,
    workspace = "3 silent",
    match = { class = "^([Ss]team)$", title = "^([Ss]team)$" },
})

-- float steam friends in bottom right corner
hl.window_rule({
    name = "steam-friends",
    float = true,
    size = { 280, 860 },
    move = {
        "((monitor_w*1)-window_w-10)",
        "((monitor_h*1)-window_h-10)",
    },
    match = { class = "^steam$", initial_title = "^Friends List$" },
})

-- disable fullscreen for battle.net
hl.window_rule({ name = "battle-net", fullscreen_state = 0, match = { title = "^Battle.net.*" } })

-- start games in fullscreen
hl.window_rule({ name = "steam-games", workspace = 10, match = { class = "^steam_app_\\d+$" } })
hl.window_rule({ name = "gamescope", workspace = 10, fullscreen = true, match = { class = "^gamescope$" } })
hl.window_rule({
    name = "ubi-connect",
    fullscreen = true,
    match = { class = "^steam_app_\\d+$", initial_title = "negative:^Ubisoft Connect$", title = "negative:^\\s*$" },
})

-- xwaylandvideobridge
hl.window_rule({
    name = "xwaylandvideobridge",
    opacity = "0.0 override",
    no_anim = true,
    no_initial_focus = true,
    no_blur = true,
    no_focus = true,
    max_size = { 1, 1 },
    match = { class = "^(xwaylandvideobridge)$" },
})
