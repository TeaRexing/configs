#!/bin/bash

# ┌──────────────────────────────┐
# │          Firefox             │ Oberer horizontaler Monitor
# └──────────────────────────────┘
# ┌──────────────────────────────┐
# │         Thunderbird          │ Unterer horizontaler Monitor
# └──────────────────────────────┘
# ┌─────────────────────────────┐
# │   Beeper                    │ Linker vertikaler Monitor (oben)
# ├─────────────────────────────│
# │   Thunar                    │ Linker vertikaler Monitor (unten)
# └─────────────────────────────┘

# Dieses Skript startet (falls nötig) Firefox, Thunderbird, Beeper und Thunar
# und ordnet die Fenster automatisch auf einem 3-Monitor-Setup an:
# - Firefox fullscreen auf dem oberen rechten Monitor
# - Thunderbird fullscreen auf dem unteren rechten Monitor
# - Beeper oben und Thunar unten auf dem linken vertikalen Monitor

WAIT_TIME=30  # max. Wartezeit pro Fenster (in Sekunden)
CHECK_INTERVAL=1

# Monitorpositionen und -größen (bitte ggf. anpassen)
VERT_MONITOR_WIDTH=1080
VERT_MONITOR_HEIGHT=1920
VERT_MONITOR_X=0
VERT_MONITOR_Y=0

TOP_MONITOR_WIDTH=1920
TOP_MONITOR_HEIGHT=1080
TOP_MONITOR_X=1080
TOP_MONITOR_Y=0

BOTTOM_MONITOR_WIDTH=1920
BOTTOM_MONITOR_HEIGHT=1080
BOTTOM_MONITOR_X=1080
BOTTOM_MONITOR_Y=1080

# Funktion: Programm starten, falls nicht bereits läuft
start_if_not_running() {
    local process_name="$1"
    local command_to_run="$2"

    if ! pgrep -x "$process_name" > /dev/null; then
        echo "Starte $process_name ..."
        eval "$command_to_run &"
    else
      echo "$process_name läuft bereits."
      # Thunar läuft als daemon und wird so immer gefunden, selbst, wenn es nicht sichtbar ist
      # Prüfe auf Sichtbarkeit
        if ! [[ $(wmctrl -lx | grep -i "$process_name") ]]; then
            echo "$process_name ist nicht sichtbar."
            eval "$command_to_run &"
            sleep 1
        fi
    fi
}

# Funktion: Auf Fenster warten
find_window() {
    local window_class="$1"
    local win_id=""
    local elapsed=0

    echo "Finde das Fenster mit Klasse: $window_class ..."

    win_id=$(wmctrl -lx | grep -i "$window_class" | awk '{print $1}' | head -n 1)

    if [[ -z "$win_id" ]]; then
        echo "Fenster für $window_class nicht gefunden"
    else
        echo "Fenster für $window_class gefunden: $win_id"
    fi

    echo "$win_id"
}

# Programme starten
start_if_not_running "firefox" "firefox"
start_if_not_running "thunderbird" "thunderbird"
start_if_not_running "beepertexts" "beeper"
start_if_not_running "Thunar" "thunar"

# Auf Fenster warten
FIREFOX_WIN=$(find_window "firefox" | tail -1)
THUNDERBIRD_WIN=$(find_window "thunderbird" | tail -1)
BEEPER_WIN=$(find_window "Beeper" | tail -1)
THUNAR_WIN=$(find_window "Thunar" | tail -1)


# Fenster verschieben
if [[ -n "$FIREFOX_WIN" ]]; then
    wmctrl -i -r "$FIREFOX_WIN" -b remove,maximized_vert,maximized_horz
    wmctrl -i -r "$FIREFOX_WIN" -e 0,$TOP_MONITOR_X,$TOP_MONITOR_Y,100,100
    wmctrl -i -r "$FIREFOX_WIN" -b add,maximized_vert,maximized_horz
fi

if [[ -n "$THUNDERBIRD_WIN" ]]; then
    wmctrl -i -r "$THUNDERBIRD_WIN" -b remove,maximized_vert,maximized_horz
    wmctrl -i -r "$THUNDERBIRD_WIN" -e 0,$BOTTOM_MONITOR_X,$BOTTOM_MONITOR_Y,100,100
    wmctrl -i -r "$THUNDERBIRD_WIN" -b add,maximized_vert,maximized_horz
fi

# Hier noch das Padding mit in Betracht ziehen
if [[ -n "$BEEPER_WIN" ]]; then
  wmctrl -i -r "$BEEPER_WIN" -b remove,maximized_vert,maximized_horz
  wmctrl -i -r "$BEEPER_WIN" -e 0,$VERT_MONITOR_X,$((VERT_MONITOR_Y + 26)),$VERT_MONITOR_WIDTH,$((VERT_MONITOR_HEIGHT / 2 - 52))
fi

if [[ -n "$THUNAR_WIN" ]]; then
    wmctrl -i -r "$THUNAR_WIN" -b remove,maximized_vert,maximized_horz
    wmctrl -i -r "$THUNAR_WIN" -e 0,$VERT_MONITOR_X,$((VERT_MONITOR_Y + VERT_MONITOR_HEIGHT / 2 + 52)),$VERT_MONITOR_WIDTH,$((VERT_MONITOR_HEIGHT / 2))
fi
