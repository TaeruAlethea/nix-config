{ ... }:
{
  flake.modules.nixos.xmppServer = { config, ... }:
		let
			simpleDomain = "demondeer.team";
			domain = "xmpp.${simpleDomain}";
			mucDomain = "conference.${domain}";
			uploadDomain = "upload.${domain}";
		in
  {
  	services.prosody = {
  		enable = true;
  		admins = [ "admin@${domain}" ];

  		ssl = {
  			cert = "/var/lib/acme/${domain}/fullchain.pem";
  			key = "/var/lib/acme/${domain}/key.pem";
  		};

  		httpFileShare = {
  			domain = uploadDomain;
  			uploadFileSizeLimit = 100 * 1024 * 1024; # 100mb
  		};

  		muc = [
  			{
  				domain = mucDomain;
  				name = "Chat Rooms";
  				restrictRoomCreation = false;
  			}
  		];

  		virtualHosts.${domain} = {
  			enabled = true;
  			domain = domain;
  			ssl = {
	  			cert = "/var/lib/acme/${domain}/fullchain.pem";
	  			key = "/var/lib/acme/${domain}/key.pem";
	  		};
			};

			modules = {
				roster = true;
				saslauth = true;
				tls = true;
				dialback = true;
				disco = true;
				carbons = true;
				pep = true;
				mam = true;
				ping = true;
				admin_adhoc = true;
				http_files = true;
			};

			allowRegistration = false;
  	};

  	users.groups.certs.members = [ "prosody" "nginx" ];

  	security.acme = {
  		acceptTerms = true;
  	# 	defaults.email = "TaeruAlethea@gmail.com";
  	# 	certs.${domain} = {
  	# 		group = "certs";
  	# 		webroot = "/var/lib/acme/acme-challenge";
  	# 		postRun = "systemctl reload prosody.service";
  	# 		extraDomainNames = [ mucDomain uploadDomain ];
  	# 	};
  	};

  	services.nginx = {
  		enable = true;
  		virtualHosts.${domain} = {
			    enableACME = true;
			    forceSSL = true;
					# locations."/.well-known/acme-challenge".root = "/var/lib/acme/acme-challenge";
					locations."/".return = "404";
  		};
  	};

	  services.ddclient = {
	    enable = true;
	    interval = "5min";
	    protocol = "cloudflare";
	    username = "token";
	    passwordFile = config.sops.secrets.cloudflare.path;
	    domains = [
	    	"${domain}"
	    	"${mucDomain}"
	    	"${uploadDomain}"
	    ];
	    zone = "${simpleDomain}";
	    ssl = true;
	  };

  	networking.firewall.allowedTCPPorts = [
  		80 # http
  		443 # https file uploads
  		5281 # prosody http file upload
  		5222 # xmpp client connections
  		5269 # xmpp server federation
  	];
  };
}
