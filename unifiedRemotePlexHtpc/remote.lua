local kb = libs.keyboard;
local win = libs.win;
local fs = require("fs");
local log = require("log");
local script = libs.script;

local plexHtpcExe = "Plex HTPC.exe";
local plexHtpcExePath = "C:\\Program Files\\Plex\\Plex HTPC\\" .. plexHtpcExe;

events.detect = function()
    actions.launchHtpc()
    actions.launchMediaserver()
    return true
end



-- @help Focus Plex HTPC
actions.switch = function()
    if (OS_WINDOWS) then
        win.switchtowait(plexHtpcExe);
    elseif (OS_LINUX) then
        foo = script.shell(
        "#!/bin/bash",
        -- Attempt to focus on Plex HTPC using wmctrl
        "PLEX_WINDOW=$(wmctrl -l | grep 'Plex HTPC')",
        "if [ ! -z \"$PLEX_WINDOW\" ]; then",
            "WINDOW_ID=$(echo \"$PLEX_WINDOW\" | awk '{print $1}')",
            "wmctrl -i -a \"$WINDOW_ID\"",
        "fi"
        )
    end
end


----------------------------------------------------------
-- power
----------------------------------------------------------

-- Launch Plex Media Server  
actions.launchMediaserver = function()
    if (OS_LINUX) then
      foo = script.shell(
      "#!/bin/bash", 
      
      -- Checking and starting Plex Media Server  
      "if ! pgrep -f \"Plex Media Server\" > /dev/null; then",
        "sudo systemctl start plexmediaserver 2>&1",
      "fi"
      )
    end
end

actions.launchHtpc = function()
    if (OS_WINDOWS) then
      if (win.window(plexHtpcExe) == 0) then   
        pcall(function()
          os.start(plexHtpcExePath);
        end);
      end
    elseif (OS_LINUX) then  
      foo = script.shell(
      "#!/bin/bash",
          
      -- Checking and starting Plex HTPC
      "if ! ps aux | grep \"/app/bin/QtWebEngineProcess\" | grep -v grep | grep \"application-name=Plex%20HTPC\" > /dev/null; then",
          "nohup flatpak run tv.plex.PlexHTPC > /dev/null 2>&1 &",   -- Detach process properly
          "sleep 5",
      "fi"
      )
    end
end


-- @help Close Plex HTPC
actions.close = function()
    if (OS_WINDOWS) then
        win.kill(plexHtpcExe);
    end
end

-- @help Restart Plex HTPC
actions.restart = function()
    actions.close();
    os.sleep(500);
    actions.launch();
end

----------------------------------------------------------
-- keyboard // alphabet search
----------------------------------------------------------

-- @help Keypress letter A
actions.letterA = function()
    actions.switch();
    kb.stroke("lshift", "A")
end

-- @help Keypress letter B
actions.letterB = function()
    actions.switch();
    kb.stroke("lshift", "B")
end

-- @help Keypress letter C
actions.letterC = function()
    actions.switch();
    kb.stroke("lshift", "C")
end

-- @help Keypress letter D
actions.letterD = function()
    actions.switch();
    kb.stroke("lshift", "D")
end

-- @help Keypress letter E
actions.letterE = function()
    actions.switch();
    kb.stroke("lshift", "E")
end

-- @help Keypress letter F
actions.letterF = function()
    actions.switch();
    kb.stroke("lshift", "F")
end

-- @help Keypress letter G
actions.letterG = function()
    actions.switch();
    kb.stroke("lshift", "G")
end

-- @help Keypress letter H
actions.letterH = function()
    actions.switch();
    kb.stroke("lshift", "H")
end

-- @help Keypress letter I
actions.letterI = function()
    actions.switch();
    kb.stroke("lshift", "I")
end

-- @help Keypress letter J
actions.letterJ = function()
    actions.switch();
    kb.stroke("lshift", "J")
end

-- @help Keypress letter K
actions.letterK = function()
    actions.switch();
    kb.stroke("lshift", "K")
end

-- @help Keypress letter L
actions.letterL = function()
    actions.switch();
    kb.stroke("lshift", "L")
end

-- @help Keypress letter M
actions.letterM = function()
    actions.switch();
    kb.stroke("lshift", "M")
end

-- @help Keypress letter N
actions.letterN = function()
    actions.switch();
    kb.stroke("lshift", "N")
end

-- @help Keypress letter O
actions.letterO = function()
    actions.switch();
    kb.stroke("lshift", "O")
end

-- @help Keypress letter P
actions.letterP = function()
    actions.switch();
    kb.stroke("lshift", "P")
end

-- @help Keypress letter Q
actions.letterQ = function()
    actions.switch();
    kb.stroke("lshift", "Q")
end

-- @help Keypress letter R
actions.letterR = function()
    actions.switch();
    kb.stroke("lshift", "R")
end

-- @help Keypress letter S
actions.letterS = function()
    actions.switch();
    kb.stroke("lshift", "S")
end

-- @help Keypress letter T
actions.letterT = function()
    actions.switch();
    kb.stroke("lshift", "T")
end

-- @help Keypress letter U
actions.letterU = function()
    actions.switch();
    kb.stroke("lshift", "U")
end

-- @help Keypress letter V
actions.letterV = function()
    actions.switch();
    kb.stroke("lshift", "V")
end

-- @help Keypress letter W
actions.letterW = function()
    actions.switch();
    kb.stroke("lshift", "W")
end

-- @help Keypress letter X
actions.letterX = function()
    actions.switch();
    kb.stroke("lshift", "X")
end

-- @help Keypress letter Y
actions.letterY = function()
    actions.switch();
    kb.stroke("lshift", "Y")
end

-- @help Keypress letter Z
actions.letterZ = function()
    actions.switch();
    kb.stroke("lshift", "Z")
end

----------------------------------------------------------
-- settings
----------------------------------------------------------


-- @help Move screen left 
actions.monitorLeft = function()
    if (OS_WINDOWS) then  
      kb.stroke("lwin", "lshift", "left")
    elseif (OS_LINUX) then
      -- Super + Left may not work in all Linux DEs, but try it first
      kb.stroke("lsuper", "lshift", "left")
    end
end
  
  -- @help Move screen right
  actions.monitorRight = function()
    if (OS_WINDOWS) then
      kb.stroke("lwin", "lshift", "right")
    elseif (OS_LINUX) then
      -- Super + Right may not work in all Linux DEs, but try it first
      kb.stroke("lsuper", "lshift", "right")
    end
end

-- @help Toggle full screen
actions.fullScreen = function()
    if (OS_WINDOWS) then
      kb.press("f11")
    elseif (OS_LINUX) then
      -- F11 may not work in all Linux DEs, but try it first
      kb.press("f11")
    end
  end

-- @help Toggle view mode
actions.viewMode = function()
    actions.switch();
    kb.press("z");
end

-- @help Cycle audio track
actions.audioTrackCycle = function()
    actions.switch();
    kb.press("a");
end

-- @help Decrease audio delay
actions.decreaseAudioDelay = function()
    actions.switch();
    kb.press("alt", "shift", "a");
end

-- @help Increase audio delay
actions.increaseAudioDelay = function()
    actions.switch();
    kb.press("alt", "a");
end

-- @help Toggle subtitle track
actions.subtitleTrackToggle = function()
    actions.switch();
    kb.press("s");
end

-- @help Cycle subtitle track
actions.subtitleTrackCycle = function()
    actions.switch();
    kb.press("l");
end

-- @help Decrease subtitle delay
actions.decreaseSubtitleDelay = function()
    actions.switch();
    kb.press("alt", "shift", "s");
end

-- @help Increase subtitle delay
actions.increaseSubtitleDelay = function()
    actions.switch();
    kb.press("alt", "s");
end

-- @help Swap output device (bound to CTRL + F9
actions.swapOutputDevice = function()
    if (OS_WINDOWS) then
        kb.stroke("ctrl", "f9");
    end
end

-- @help Decrease playback volume
actions.volumeDown = function()
    if OS_WINDOWS then
      kb.press("oem_minus")
    elseif OS_LINUX then
      kb.press("kpsubtract") 
    end
end

-- @help Increase playback volume
actions.volumeUp = function()
    if OS_WINDOWS then
      kb.press("oem_plus")
    elseif OS_LINUX then
      kb.press("kpadd")
    end
  end
----------------------------------------------------------
-- navigation
----------------------------------------------------------

-- @help Navigate back
actions.back = function()
    actions.switch();
    kb.press("esc");
end

-- @help Navigate up
actions.up = function()
    actions.switch();
    kb.press("up");
end

-- @help Toggle watched
actions.toggleWatched = function()
    actions.switch();
    kb.press("w")
end

-- @help Navigate left
actions.left = function()
    actions.switch();
    kb.press("left");
end

-- @help Select
actions.select = function()
    actions.switch();
    kb.press("return");
end

-- @help Navigate right
actions.right = function()
    actions.switch();
    kb.press("right");
end

-- @help Navigate down
actions.down = function()
    actions.switch();
    kb.press("down");
end

-- @help Show menu (NOTE: bound by default but doesn't seem to do anything)
actions.menu = function()
    actions.switch();
    kb.press("m");
end

-- @help Navigate home
actions.home = function()
    actions.switch();
    kb.press("h");
end

-- @help Show OSD
actions.osd = function()
    actions.switch();
    kb.press("enter");
end

----------------------------------------------------------
-- playback
----------------------------------------------------------

-- @help Previous item (NOTE: not bound by default in Plex HTPC)
actions.skipPrevious = function()
    actions.switch();
    kb.press("delete");
end

-- @help Step backwards (-10 min or -1 chapter)
actions.stepBackward = function()
    actions.switch();
    kb.press("home");
end

-- @help Seek backwards (-10 sec)
actions.seekBackward = function()
    actions.switch();
    kb.press("pagedown");
end

-- @help Toggle play/pause
actions.play_pause = function()
    actions.switch();
    kb.press("space");
end

-- @help Seek forward (+10 sec)
actions.seekForward = function()
    actions.switch();
    kb.press("pageup");
end

-- @help Step forward (+10 min or +1 chapter)
actions.stepForward = function()
    actions.switch();
    kb.press("end");
end

-- @help Next item (NOTE: not bound by default in Plex HTPC)
actions.skipNext = function()
    actions.switch();
    kb.press("insert");
end
