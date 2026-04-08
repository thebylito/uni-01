# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_22
    pkgs.yarn
    pkgs.bun
    pkgs.python3
  ];
  # Sets environment variables in the workspace
  env = { };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "google.gemini-cli-vscode-ide-companion"
      "vscodevim.vim"
      "svelte.svelte-vscode"
    ];
    previews = {
      enable = true;
      previews = {
        web = {
          command = [ "python3" "-m" "http.server" "$PORT" "--bind" "0.0.0.0" ];
          manager = "web";
        };
      };
    };
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # Open editors for the following files by default, if they exist:
        default.openFiles = [
        ];
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
  };
}
