{ pkgs }:

{
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    libsForQt5.polkit-kde-agent nixtension.polkit-kde-agent-runner
  ];
}
