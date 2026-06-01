local rimeInputSourceID = "im.rime.inputmethod.Squirrel.Hans"
local defaultEnglishInputSourceID = "com.apple.keylayout.ABC"

local function Rime() hs.keycodes.currentSourceID(rimeInputSourceID) end

local function DefaultEnglish() hs.keycodes.currentSourceID(defaultEnglishInputSourceID) end

-- Disabled to leave Option/Meta shortcuts available for terminal/tmux.
-- hs.hotkey.bind(inputChineseHotkey, 'S', function() Rime() end)

-- hs.hotkey.bind(inputHotkey, 'E', function() DefaultEnglish() end)

local function cycleInputMethod()
    if hs.keycodes.currentSourceID() == rimeInputSourceID then
        DefaultEnglish()
    else
        Rime()
    end
end

-- hs.hotkey.bind(inputHotkey, '.', cycleInputMethod)
-- Ctrl+Option+. avoids tmux's Option/Meta bindings and macOS Ctrl+Space handling.
hs.hotkey.bind(inputChineseHotkey, '.', cycleInputMethod)
