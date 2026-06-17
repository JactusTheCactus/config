{ config, pkgs, ... }: {
	imports = [
		./hardware-configuration.nix
		(if builtins.pathExists ./local.nix then ./local.nix else {})
	];
	boot.loader.grub = {
		enable = true;
		useOSProber = true;
	};
	networking = {
		networkmanager.enable = true;
		firewall.allowedTCPPorts = [22];
	};
	time.timeZone = "America/Vancouver";
	i18n.defaultLocale = "en_GB.UTF-8";
	services = {
		greetd = {
			enable = true;
			settings.default_session = {
				user = "greeter";
				command = with pkgs; "${tuigreet}/bin/tuigreet --time --cmd Hyprland";
			};
		};
		openssh.enable = true;
		xserver.xkb = {
			layout = "us";
			variant = "";
		};
	};
	users.users.devin = {
		isNormalUser = true;
		description = "devin";
		extraGroups = ["networkmanager" "wheel"];
		packages = with pkgs; [];
		shell = with pkgs; nushell;
	};
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = ["nix-command" "flakes"];
	fonts.packages = with pkgs; [fira-code];
	environment = {
		shells = with pkgs; [nushell];
		variables.TERMINAL = "wezterm";
		systemPackages = with pkgs; [
			bat
			chezmoi
			cowsay
			dasel
			git
			gum
			helix
			hyprpaper
			lazygit
			libreoffice-qt
			lolcat
			lowdown
			mc
			minijinja
			neovim
			nushell
			shellcheck
			tree
			vhs
			vivaldi
			wezterm
			waybar
			wofi
			yq
			(pkgs.writeShellApplication {
				name = "ns";
				runtimeInputs = with pkgs; [fzf nix-search-tv];
				text = with pkgs; builtins.readFile "${nix-search-tv.src}/nixpkgs.sh";
				excludeShellChecks = ["SC2016"];
			})
		];
	};
	programs = {
		hyprland.enable = true;
		# steam.enable = true;
	};
	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [xdg-desktop-portal-gtk];
	};
	hardware.graphics.enable = true;
	system.stateVersion = "25.11";
}
