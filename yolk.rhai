export const device = #{
    linux: SYSTEM.platform == "Linux",
    windows: SYSTEM.platform == "Windows",
    archHome: SYSTEM.distro == "Arch Linux" && SYSTEM.hostname != "arch-weasel-fj" && SYSTEM.hostname != "fwk01-joska",
    archFwk: SYSTEM.distro == "Arch Linux" && SYSTEM.hostname == "fwk01-joska",
    archWeasel: SYSTEM.distro == "Arch Linux" && SYSTEM.hostname == "arch-weasel-fj",
};

export let eggs = #{
    git: #{ targets: "~/.config/git" },
    nvim: #{ targets: if device.linux { "~/.config/nvim" } else { "~/AppData/Local/nvim" } },

    // Arch setup
    eww: #{ enabled: device.archHome, targets: "~/.config/eww" },
    hypr: #{ enabled: device.archHome, targets: "~/.config/hypr" },
    hyprSddm: #{ enabled: device.archHome, targets: "/var/lib/sddm/.config/hypr" },
    kitty: #{ enabled: device.archHome || device.archFwk, targets: "~/.config/kitty" },
    mako: #{ enabled: device.archHome, targets: "~/.config/mako" },
    wofi: #{ enabled: device.archHome, targets: "~/.config/wofi" },
    gaming: #{ enabled: device.archHome, targets: "~/.gaming/" },
    MangoHud: #{ enabled: device.archHome, targets: "~/.config/MangoHud" },

    // Arch with River
    river: #{ enabled: device.archFwk, targets: "~/.config/river" },
    fuzzel: #{ enabled: device.archFwk, targets: "~/.config/fuzzel" },
    croffle: #{ enabled: device.archFwk, targets: "~/.config/croffle" },

    // General linux setup
    tmux: #{ enabled: device.linux, targets: "~", strategy: "merge" },
    zsh: #{ enabled: device.linux, targets: "~", strategy: "merge" },
};
