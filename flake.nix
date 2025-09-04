{
  description = "Simple Flake Template";

  outputs =
    { self }:
    {
      templates.default = {
        path = ./example;
        description = "A simple Nix flake with a NodeJS v24 devshell";
        welcomeText = ''
          Welcome to Widdershin's simple Nix flake template!

          This flake provides a development shell with NodeJS v24.

          To enter the development shell, run:

          ```
          nix develop
          ```

          Or alternatively, if you have direnv installed, run:

          ```
          direnv allow
          ```

          If you don't have direnv installed, you can install it globally with nix:

          ```
          nix profile install nixpkgs#direnv
          ```
        '';
      };
    };
}
