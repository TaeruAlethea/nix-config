{ ... }: {
	flake.nixosModules.vr = { pkgs, ... } :
	{
		services.wivrn = {
			enable = true;
			openFirewall = true;

			# Run WiVRn as a systemd service on startup
			autoStart = true;

			# If you're running this with an nVidia GPU and want to use GPU Encoding (and don't otherwise have CUDA enabled system wide), you need to override the cudaSupport variable.
			package = (pkgs.wivrn.override { cudaSupport = true; });
		};
	};
}
