export const device = #{
    linux: SYSTEM.platform == "Linux",
    windows: SYSTEM.platform == "Windows",
};

export let eggs = #{
    eww: #{ enabled: device.linux, targets: "~/.config/eww" },
    hypr: #{ enabled: device.linux, targets: "~/.config/hypr" },
    git: #{ targets: "~/.config/git" },
    kitty: #{ enabled: device.linux, targets: "~/.config/kitty" },
    mako: #{ enabled: device.linux, targets: "~/.config/mako" },
    wofi: #{ enabled: device.linux, targets: "~/.config/wofi" },
    tmux: #{ enabled: device.linux, targets: "~", strategy: "merge" },
    zsh: #{ enabled: device.linux, targets: "~", strategy: "merge" },
};
