export const device = #{
    linux: SYSTEM.platform == "Linux",
    windows: SYSTEM.platform == "Windows",
    archHome: SYSTEM.distro == "Arch Linux" && SYSTEM.hostname != "arch-weasel-fj",
    archWeasel: SYSTEM.distro == "Arch Linux" && SYSTEM.hostname == "arch-weasel-fj",
};

export let eggs = #{
    git: #{ targets: "~/.config/git" },
    nvim: #{ targets: if device.linux { "~/.config/nvim" } else { "~/AppData/Local/nvim" } },

    // Arch setup
    eww: #{ enabled: device.archHome, targets: "~/.config/eww" },
    hypr: #{ enabled: device.archHome, targets: "~/.config/hypr" },
    hyprSddm: #{ enabled: device.archHome, targets: "/var/lib/sddm/.config/hypr" },
    kitty: #{ enabled: device.archHome, targets: "~/.config/kitty" },
    mako: #{ enabled: device.archHome, targets: "~/.config/mako" },
    wofi: #{ enabled: device.archHome, targets: "~/.config/wofi" },
    gaming: #{ enabled: device.archHome, targets: "~/.gaming/" },
    MangoHud: #{ enabled: device.archHome, targets: "~/.config/MangoHud" },

    // General linux setup
    tmux: #{ enabled: device.linux, targets: "~", strategy: "merge" },
    zsh: #{ enabled: device.linux, targets: "~", strategy: "merge" },
};
