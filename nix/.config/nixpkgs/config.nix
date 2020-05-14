{
  packageOverrides = pkgs: with pkgs; rec {
    myProfile = writeText "my-nix-custom-profile" ''
      export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
      export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
    '';
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        (runCommand "profile" {} ''
          mkdir -p $out/etc/profile.d
          cp ${myProfile} $out/etc/profile.d/my-nix-custom-profile.sh
        '')
        jq
        neomutt
        ripgrep
        universal-ctags
        entr
        bat
        fd
        taskwarrior
        timewarrior
        tealdeer
        fpp
        autojump
        yarn
      ];
      extraOutputsToInstall = [ "man" "doc" ];
    };
  };
}
