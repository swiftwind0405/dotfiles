local function Chinese()
    hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Hans")
end

local function English() hs.keycodes.currentSourceID("com.apple.keylayout.ABC") end

hs.hotkey.bind(inputHotkey, 'S', function() Chinese() end)

hs.hotkey.bind(inputHotkey, 'E', function() English() end)

local function cycleInputMethod()
    if hs.keycodes.currentSourceID() == "com.apple.keylayout.ABC" then
        hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Hans")
    elseif hs.keycodes.currentSourceID() == "im.rime.inputmethod.Squirrel.Hans" then
        hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
    end
end

hs.hotkey.bind(inputHotkey, '.', cycleInputMethod)
