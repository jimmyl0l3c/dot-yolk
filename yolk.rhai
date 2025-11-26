export const device = #{
    linux: SYSTEM.platform == "Linux",
    windows: SYSTEM.platform == "Windows",
    arch: SYSTEM.distro == "Arch Linux"
};

export let eggs = #{
    git: #{ targets: "~/.config/git" },
    nvim: #{ targets: if device.linux { "~/.config/nvim" } else { "~/AppData/Local/nvim" } },

    // Arch setup
    eww: #{ enabled: device.arch, targets: "~/.config/eww" },
    hypr: #{ enabled: device.arch, targets: "~/.config/hypr" },
    hyprSddm: #{ enabled: device.arch, targets: "/var/lib/sddm/.config/hypr" },
    kitty: #{ enabled: device.arch, targets: "~/.config/kitty" },
    mako: #{ enabled: device.arch, targets: "~/.config/mako" },
    wofi: #{ enabled: device.arch, targets: "~/.config/wofi" },
    gaming: #{ enabled: device.arch, targets: "~/.gaming/" },

    // General linux setup
    tmux: #{ enabled: device.linux, targets: "~", strategy: "merge" },
    zsh: #{ enabled: device.linux, targets: "~", strategy: "merge" },
};
