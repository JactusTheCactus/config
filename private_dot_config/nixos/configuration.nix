{ config, lib, pkgs, ... }: {
	imports = [./hardware-configuration.nix];
	boot.loader.grub.enable = true;
	boot.loader.grub.device = "/dev/sda";
	boot.loader.grub.useOSProber = true;
	networking.hostName = "nix-vm";
	networking.networkmanager.enable = true;
	networking.firewall.allowedTCPPorts = [22];
	time.timeZone = "America/Vancouver";
	i18n.defaultLocale = "en_GB.UTF-8";
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};
	users.users.devin = {
		isNormalUser = true;
		description = "devin";
		extraGroups = [
			"networkmanager"
			"wheel"
		];
		packages = with pkgs; [];
		shell = pkgs.nushell;
	};
	environment.shells = with pkgs; [nushell];
	environment.variables = {
		TERMINAL = "wezterm";
	};
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];
	fonts.packages = with pkgs; [fira-code];
	environment.systemPackages = with pkgs; [
		bat
		chezmoi
		cowsay
		dasel
		git
		gum
		helix
		hyprpaper
		lazygit
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
			text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
			excludeShellChecks = ["SC2016"];
		})
	];
	programs.hyprland.enable = true;
	xdg.portal.enable = true;
	xdg.portal.extraPortals = with pkgs; [xdg-desktop-portal-gtk];
	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				user = "greeter";
				command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
			};
		};
	};
	hardware.graphics.enable = true;
	hardware.nvidia.modesetting.enable = true;
	services.openssh.enable = true;
	system.stateVersion = "25.11";
}
