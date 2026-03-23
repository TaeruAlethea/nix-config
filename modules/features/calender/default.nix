{ ... }: {
		flake.modules.homeManager.calendar = {
	  # home.packages = with pkgs; [  ];

		programs = {
			khal = {
				enable = true;
				locale = {
					firstweekday = 0;
					weeknumbers = "left";
				};
			};
		};

		accounts.calendar = {
			basePath = ".local/share/calendar";

			accounts.astraeaf = {
				khal = {
					enable = true;
				};

				vdirsyncer = {
					enable = true;
				};
			};
		};
	};
}
