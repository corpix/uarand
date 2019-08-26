let
  nixpkgs = builtins.fetchTarball {
    url    = "https://github.com/nixos/nixpkgs/archive/ddf38a8241089d79c3bcd1777781b6438ab88d84.tar.gz";
    sha256 = "0fjk69mn58h0gjzgxgnkfkhhf1l707bg2cn4823ma9xbjxbhl0ya";
  };
in with import nixpkgs {};
stdenv.mkDerivation {
  name = "nix-shell";
  buildInputs = [
    go golangci-lint cacert openssl
    gcc git gnumake
  ];
  shellHook = ''
    unset GOPATH
    export NIX_PATH=nixpkgs=${nixpkgs}
  '';
}
