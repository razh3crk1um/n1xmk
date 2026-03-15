{pkgs, ...}:
pkgs.writeShellApplication {
  name = "yb";
  runtimeInputs = [pkgs.yt-dlp pkgs.ffmpeg];
  text = ''
    set -ueo pipefail

    if [ "$#" -lt 3 ]; then
        echo "usage: yb <url> <items> <output_name>"
        exit 1
    fi

    URL=$1
    ITEMS=$2
    NAME=$3
    BASE_DIR="$HOME/media/music/.relay"

    yt-dlp -x \
        --audio-format m4a \
        --add-metadata \
        --embed-thumbnail \
        -P "$BASE_DIR" \
        --playlist-items "$ITEMS" \
        -o "$NAME.%(ext)s" \
        "$URL"

        # --cookies-from-browser firefox \

    echo "提取成功！音频已存至: $BASE_DIR/$NAME.m4a"
  '';
}
