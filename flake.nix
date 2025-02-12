{
description = "Nixos config flake";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.11";

#	home-manager = {
#		url = "github:nix-community/home-manager";
#		inputs.nixpkgs.follows = "nixpkgs";
#	};
};

outputs = { self, nixpkgs, ... }@inputs: {
	nixosConfigurations.shizueos = nixpkgs.lib.nixosSystem {
		specialArgs = {inherit inputs;};
		modules = [
			./configuration.nix
			#inputs.home-manager.nixosModules.default
		];
	};
};
}
