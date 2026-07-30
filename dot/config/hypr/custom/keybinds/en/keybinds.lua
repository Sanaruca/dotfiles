hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )


hl.unbind("SUPER + B")
hl.unbind("SUPER + W")
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser), { description = "App: Browser" })

hl.unbind("SUPER + Return")
hl.bind("SUPER + Return", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
    { description = "Window: Maximize" })


hl.unbind("SUPER + T")
hl.bind("SUPER + T", hl.dsp.exec_cmd(software_store))

hl.unbind("SUPER + Q")
hl.unbind("SUPER + SHIFT + delete")
hl.bind("SUPER + SHIFT + delete", hl.dsp.window.close(), { description = "Window: Close" }) -- Close


hl.unbind("SUPER + Slash")
hl.bind("SUPER + Slash", hl.dsp.exec_cmd(terminal), { description = "App: Terminal" })

hl.bind("SUPER + Space", hl.dsp.global("quickshell:cheatsheetToggle"), { description = "Shell: Toggle cheatsheet" })

-- Focus in direction
--#/# bind = SUPER + J/I/L/K,, -- Focus in direction
for i = 1, 4 do
    local arrowkey = { "J", "L", "I", "K" }
    local focusdir = { "l", "r", "u", "d" }
    hl.unbind("SUPER + " .. arrowkey[i])
    hl.bind("SUPER + " .. arrowkey[i], hl.dsp.focus({ direction = focusdir[i] }),
        { description = "Window: Focus " .. arrowkey[i] })
end

for i = 1, 2 do
    local keys = { "Left", "Right" }
    local prefix = { "m-", "m+" }
    hl.bind("CTRL + SUPER + ALT + " .. keys[i], hl.dsp.focus({ workspace = prefix[i] .. "1" }))
end

--#/# bind = CTRL+SUPER+ALT, ←/→,, -- # [hidden] Focus busy left/right
for i = 1, 2 do
    local keys = { "J", "L" }
    local prefix = { "m-", "m+" }
    hl.unbind("CTRL + SUPER + ALT + " .. keys[i])
    hl.bind("CTRL + SUPER + ALT + " .. keys[i], hl.dsp.focus({ workspace = prefix[i] .. "1" }))
end


for i = 1, 2 do
    local keys = { "A", "D" }
    local prefix = { "r-", "r+" }
    local descdir = { "left", "right" }
    hl.unbind("SUPER + " .. keys[i])
    hl.bind("SUPER + " .. keys[i], hl.dsp.focus({ workspace = prefix[i] .. "1" }), {description = "Workspace: Focus " .. descdir[i]})
end

for i = 1, 2 do
    local keys = { "J", "L" }
    local prefix = { "r-", "r+" }
    local descdir = { "left", "right" }
    hl.unbind("CTRL + SUPER + SHIFT + " .. keys[i])
    hl.bind("CTRL + SUPER + SHIFT + " .. keys[i], hl.dsp.window.move({ workspace = prefix[i] .. "1" })) -- # [hidden]
end

hl.unbind("SUPER + SHIFT + L")
--#/# bind =  CTRL+SUPER, J/I/L/K,, -- Move in direction
for i = 1, 4 do
    local arrowkey = { "J", "L", "I", "K" }
    local focusdir = { "l", "r", "u", "d" }
    hl.unbind("CTRL+SUPER + " .. arrowkey[i])
    hl.bind("CTRL+SUPER + " .. arrowkey[i], hl.dsp.window.move({ direction = focusdir[i] }),
        { description = "Window: Move " .. arrowkey[i] })
end


hl.bind("SUPER + H", function()
    hl.dispatch(hl.dsp.layout("togglesplit"))
end)




-- Grow window by 50px horizontally and vertically (holding down the keys works)
hl.bind("SUPER + SHIFT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + I", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
