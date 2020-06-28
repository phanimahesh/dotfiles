{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; rec {
    myProfile = writeText "my-nix-custom-profile" ''
      # Already handled by zplug
      # export PATH=$PATH:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin
      # export MANPATH=$MANPATH:$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man
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
        skim
        universal-ctags
        entr
        bat
        fd
        taskwarrior
        timewarrior
        vit
        tealdeer
        fpp
        autojump
        yarn
      ];
      extraOutputsToInstall = [ "man" "doc" ];
    };
  };
}
