# unifiedRemotePlexHtpc
Control Plex HTPC on Windows with Unified Remote.

## Remote Screenshot
<img src="https://github.com/aaronkirschen/unifiedRemotePlexHtpc/blob/main/images/screenShot.jpg?raw=true" width=50% height=50%>


## Important Note
In order for previous/next item buttons to work, you must add two entries to the `keyboard.json` input map located in the inputmaps folder of the Plex HTPC install path. 

The entries you must add are `"Del": "skip_previous"` and `"Ins": "skip_next"`.

The complete `keyboard.json` input map used at the time of writing this is:
```
{
  "name": "Generic Keyboard",
  "idmatcher": "Keyboard.*",
  "mapping": {
    "Del": "skip_previous",
    "Ins": "skip_next",    
    "Left": "left",
    "Right": "right",
    "Up": "up",
    "Down": "down",
    "Return|Enter": {
      "short": "enter",
      "long": "menu"
    },
    "Back|Esc|Backspace": {
      "short": "back",
      "long": "home"
    },
    "(?:Shift\\+)?([A-Z0-9.])": "%1",
    "Shift\\+([A-Z])": "jump+%1",
    "Space": [
      "space",
      "play_pause"
    ],
    "P": "play_pause",
    "Ctrl\\+P": "pause",
    "X": "stop",
    "B": "back",
    "H": "home",
    "M": "menu",
    "A": "cycle_audio",
    "L": "cycle_subtitles",
    "S": "toggle_subtitles",
    "Alt\\+A": "increase_audio_delay",
    "Alt\\+Shift\\+A": "decrease_audio_delay",
    "Alt\\+S": "increase_subtitles_delay",
    "Alt\\+Shift\\+S": "decrease_subtitles_delay",
    "PgUp": [
      "page_up",
      "seek_forward"
    ],
    "PgDown": [
      "page_down",
      "seek_backward"
    ],
    "Home": "step_backward",
    "End": "step_forward",
    "Ctrl\\+F": "search",
    "\\[": "previous_pivot_tab",
    "\\]": "next_pivot_tab",
    "=": "increase_volume",
    "(Shift\\+)?\\+": "increase_volume",
    "\\-": "decrease_volume",
    "I": "info",
    "W": "toggle_watched",
    "Z": "cycle_aspect_ratio",
    "Ctrl\\+Shift\\+D": "debug",
    "Alt\\+(Return|Enter)": "toggle_fullscreen",
    "F11": "toggle_fullscreen",
    "\\\\": "toggle_fullscreen",
    "E": "exit",
    "(Media Fast Forward)|F": "seek_forward",
    "(Media Rewind)|R": "seek_backward",
    "(Media Play)": "play",
    "(Media Pause)": "pause"
  }
}
```