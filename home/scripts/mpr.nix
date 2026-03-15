{pkgs, ...}:
pkgs.writeShellApplication {
  name = "mpr";
  runtimeInputs = [pkgs.mpc pkgs.libnotify];
  text = ''
    set +e

    mpc clear
    mpc update

    playlists=("mkvsa" "miku" "yousa" "vloty" "vocal" "inst")

    for pl in "''${playlists[@]}"; do
      mpc ls "$pl" | mpc add
    done

    mpc play
    mpc toggle

    notify-send -u normal "歌单更新成功" "ncmpcpp"
  '';
}
