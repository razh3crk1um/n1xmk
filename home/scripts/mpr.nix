{pkgs, ...}:
pkgs.writeShellApplication {
  name = "mpr";
  runtimeInputs = [pkgs.mpc pkgs.libnotify];
  text = ''
    set +e

    mpc -q clear
    mpc -q update

    playlists=("mkvsa" "miku" "yousa" "vloty" "vocal" "inst")

    for pl in "''${playlists[@]}"; do
      mpc ls "$pl" | mpc -q add
    done

    mpc -q play
    mpc -q toggle

    notify-send -u normal "歌单更新成功" "Music Player Daemon"
  '';
}
