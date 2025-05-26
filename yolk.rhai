export const device = #{
    linux: SYSTEM.platform == "Linux",
    windows: SYSTEM.platform == "Windows",
};

export let eggs = #{
    git: #{ targets: "~/.config/git" },
    nvim: #{ targets: if device.linux { "~/.config/nvim" } else { "~/AppData/Local/nvim" } },

    // Arch setup
    eww: #{ enabled: device.linux, targets: "~/.config/eww" },
    hypr: #{ enabled: device.linux, targets: "~/.config/hypr" },
    kitty: #{ enabled: device.linux, targets: "~/.config/kitty" },
    mako: #{ enabled: device.linux, targets: "~/.config/mako" },
    wofi: #{ enabled: device.linux, targets: "~/.config/wofi" },

    // General linux setup
    tmux: #{ enabled: device.linux, targets: "~", strategy: "merge" },
    zsh: #{ enabled: device.linux, targets: "~", strategy: "merge" },
};
