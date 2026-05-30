local function Chinese()
    hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Hans")
end

local function English() hs.keycodes.currentSourceID("com.apple.keylayout.ABC") end

-- Disabled to leave Option/Meta shortcuts available for terminal/tmux.
-- hs.hotkey.bind(inputChineseHotkey, 'S', function() Chinese() end)

-- hs.hotkey.bind(inputHotkey, 'E', function() English() end)

local function cycleInputMethod()
    if hs.keycodes.currentSourceID() == "com.apple.keylayout.ABC" then
        hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Hans")
    elseif hs.keycodes.currentSourceID() == "im.rime.inputmethod.Squirrel.Hans" then
        hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
    end
end

-- hs.hotkey.bind(inputHotkey, '.', cycleInputMethod)
