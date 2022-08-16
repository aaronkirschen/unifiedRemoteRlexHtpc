local kb = libs.keyboard;
local win = libs.win;
local log = require("log");

local plexHtpcExe = "Plex HTPC.exe";
local plexHtpcExePath = "C:\\Program Files\\Plex\\Plex HTPC\\" .. plexHtpcExe;

events.detect = function()
    if (OS_WINDOWS) then
        return libs.fs.exists(plexHtpcExePath);
    end
end

-- @help Launch Plex HTPC
actions.launch = function()
    if (OS_WINDOWS) then
        pcall(function()
            os.start(plexHtpcExePath);
        end);
    end
end

-- @help Focus Plex HTPC
actions.switch = function()
    if (OS_WINDOWS) then
        if (win.window(plexHtpcExe) == 0) then
            actions.launch();
        end
        win.switchtowait(plexHtpcExe);
    else
        log.error("This remote only supports Windows.");
    end
end
