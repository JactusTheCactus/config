{
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			monitor = ",preferred,auto,1";
			"$mod" = "SUPER";
			bind = [
				"$mod, Return, exec, kitty"
				"$mod, Q, killactive"
				"$mod, D, exec, wofi --show drun"
			];
			exec-once = ["waybar"];
		};
	};
}
