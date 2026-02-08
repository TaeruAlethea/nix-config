{ ... }: {
	xdg.configFile."wireplumber/wireplumber.conf.d/51-wavexlr.conf".source = ./51-wavexlr.conf;
	xdg.dataFile."wireplumber/scripts/wavexlrfix.lua".source = ./wavexlrfix.lua;
}
