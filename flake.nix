{
description = "Nixos config flake";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.11";

	openmw-nix = {
		url = "git+https://codeberg.org/PopeRigby/openmw-nix.git";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
};

outputs = { self, nixpkgs, openmw-nix, ...  }@inputs: {
	nixosConfigurations.shizueos = nixpkgs.lib.nixosSystem {
		specialArgs = {inherit inputs;};
		modules = [
			./configuration.nix
			inputs.home-manager.nixosModules.default
		];
		#environment.systemPackages = with openmw-nix.packages.x86_64-linux; [
        	#	delta-plugin
        	#	openmw-dev
        	#	openmw-validator
        	#	plox
      		#];
	};
};
}
