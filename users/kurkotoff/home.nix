{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "kurkotoff";
    homeDirectory = "/home/kurkotoff";
    stateVersion = "22.05";

    packages = with pkgs; [
	gamemode
	tealdeer
	git-crypt
	gnupg
	ripgrep
	fzf
	pinentry_qt
	nodejs
	rnix-lsp
	tdesktop
        lutris
        spectacle
        bat
        gh
        firefox
        thunderbird
        discord
    ];
  };

  programs.gpg = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "kurk070ff";
    userEmail = "kurk070ff@yandex.ru";
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.vscode = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    sessionVariables = rec {
      EDITOR = "vim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme   = "itchy";
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    
    coc.enable = true;
    coc.settings = {
      "languageserver" = {
        "nix" = {
          "command" = "rnix-lsp";
          "filetypes" = [
            "nix"
          ];
        };
      };
    };

    withPython3 = true;

    extraConfig = ''
      set number
      set relativenumber
      inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
      let mapleader = " "
    '';

    plugins = with pkgs.vimPlugins; [
      auto-pairs
      lightline-vim
      nerdtree
      telescope-nvim
      toggleterm-nvim
      vim-nix
      nvim-comment
    ];
  };

  programs.home-manager.enable = true;
}
