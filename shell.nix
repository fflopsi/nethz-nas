let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  packages = with pkgs; [
    cifs-utils
  ];
  shellHook = ''
    mkdir nas
    read -p "Enter ETH username: " ethuser
    sudo mount.cifs -o username=$ethuser,domain=D,vers=3.0,uid=1000,gid=100 //nas22.ethz.ch/id_service_sth_$(echo $ethuser | cut -c1)/$ethuser nas
    trap "sudo umount nas" EXIT
  '';
}
