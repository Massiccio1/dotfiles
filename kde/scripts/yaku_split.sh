sleep 2

TERMINAL_ID_0=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 0)
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitTerminalLeftRight "$TERMINAL_ID_0"

