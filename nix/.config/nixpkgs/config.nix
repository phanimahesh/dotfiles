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
        # Custom profile - currently empty, but setting a placeholder if needed
        (runCommand "profile" {} ''
          mkdir -p $out/etc/profile.d
          cp ${myProfile} $out/etc/profile.d/my-nix-custom-profile.sh
        '')
        # json manipulation utility
        jq
        # csv manipulation utility
        xsv
        # html manipulation utility. jq for html
        pup

        # single machine backup tool
        borgbackup
        # email client
        neomutt
        # better grep
        ripgrep
        # fuzzy finder
        skim
        # multi pod log tailing for k8s
        stern
        # code navigation helper - tags generator
        universal-ctags
        # Watch files/dirs for changes and run commands
        entr
        # Better cat. syntax highlighting, numbering
        bat
        # Better find
        fd
        # Task management tool
        taskwarrior
        # Time tracking tool
        timewarrior
        # Visual interface to taskwarrior
        vit
        # Github's wrapper for git
        gitAndTools.hub
        # maintain cheatsheets
        tealdeer
        # facebook path picker. pipe whatever into fpp to find path like strings
        fpp
        # Navigate between directories with ease
        autojump
        # The sensible node package manager
        yarn
      ];
      extraOutputsToInstall = [ "man" "doc" ];
    };
  };
}
