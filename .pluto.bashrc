#  Flatpak apps under KDE don't seem to scale their fonts properly.

export ELECTRON_SCALE_FACTOR="1.25"

function skype() { flatpak run com.skype.Client --force-device-scale-factor="$ELECTRON_SCALE_FACTOR" ; }

function spotify() { flatpak run com.spotify.Client --force-device-scale-factor="$ELECTRON_SCALE_FACTOR" ; }

function slack() { flatpak run com.slack.Slack --force-device-scale-factor="$ELECTRON_SCALE_FACTOR" ; }

function code() { /usr/bin/code --force-device-scale-factor="$ELECTRON_SCALE_FACTOR" 2>/dev/null ; }

source ~/.dotnet/register-completions.bash
