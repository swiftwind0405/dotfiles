-- 这里指定中文和英文输入法的 ID
local function Chinese()
    hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Hans")
end

local function English() hs.keycodes.currentSourceID("com.apple.keylayout.ABC") end

function updateFocusAppInputMethod()
    local focusAppPath = hs.window.frontmostWindow():application():path()
    for index, app in pairs(appInputMethod) do
        local appPath = app[1]
        local expectedIme = app[2]

        if focusAppPath == appPath then
            if expectedIme == 'English' then
                English()
            else
                Chinese()
            end
            break
        end
    end
end

-- 当选中某窗口按下 ctrl+command+. 时会显示应用的路径、名字等信息
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
    hs.alert.show("App path:        " ..
                      hs.window.focusedWindow():application():path() .. "\n" ..
                      "App name:      " ..
                      hs.window.focusedWindow():application():name() .. "\n" ..
                      "IM source id:  " .. hs.keycodes.currentSourceID())
end)

-- Handle cursor focus and application's screen manage.
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        updateFocusAppInputMethod()
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
