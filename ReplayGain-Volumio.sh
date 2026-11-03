#!/bin/bash

# Exit on error, undefined variables, and pipe failures
set -euo pipefail

# Variables
MPD_TMPL="/volumio/app/plugins/music_service/mpd/mpd.conf.tmpl"
MPD_TMPL_BAK="/volumio/app/plugins/music_service/mpd/.mpd.conf.tmpl.bak"

# Usage
usage() {
    echo "Usage: $0 [option]"
    echo "  -e, --enable   Enable ReplayGain"
    echo "  -r, --restore  Restore stock mpd.conf.tmpl"
    exit 1
}

# Parse arguments
ACTION=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        -e|--enable)  ACTION="enable" ;;
        -r|--restore) ACTION="restore" ;;
        *) usage ;;
    esac
    shift
done

if [[ -z "$ACTION" ]]; then
    usage
fi

# Restoring the stock mpd.conf.tmpl
if [[ "$ACTION" == "restore" ]]; then
    if [[ -f "$MPD_TMPL_BAK" ]]; then
        echo "--- Removing ReplayGain and restoring the stock mpd.conf.tmpl ---"
        mv "$MPD_TMPL_BAK" "$MPD_TMPL"
        echo "--- Now go click _save_ on mixertype in the playback options to restart mpd ---"
    else
        echo "--- There is nothing to restore. Your stock mpd.conf.tmpl should already be in place ---"
        exit 3
    fi
    exit 0
fi

# Enabling ReplayGain
if [[ "$ACTION" == "enable" ]]; then
    # Check if ReplayGain is already in the file to prevent double-appending
    if grep -q "replaygain" "$MPD_TMPL"; then
        echo "--- ReplayGain should already be enabled! ---"
        exit 1
    fi

    echo "--- Making backup and enabling ReplayGain ---"
    cp -p "$MPD_TMPL" "$MPD_TMPL_BAK"

    cat <<EOF >> "$MPD_TMPL"

###############################################################################
# Enable ReplayGain
###############################################################################
replaygain "auto"
replaygain_preamp "0"
replaygain_limit "yes"
EOF

    echo "--- Now go click _save_ on mixertype in the playback options to restart mpd ---"
    exit 0
fi
