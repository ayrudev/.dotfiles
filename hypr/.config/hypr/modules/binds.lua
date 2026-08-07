require("modules/apps")
local mainMod = "SUPER"

hl.bind(
  mainMod .. " + SHIFT + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(Browser))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(Discord))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FileManager))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(Lockscreen))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("~/.local/bin/toggle-inhibitor"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("kitty -o confirm_os_window_close=0 --class bluetui bluetui"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("kitty -o confirm_os_window_close=0 --class impala impala"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + P", hl.dsp.window.center())
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.float())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + CTRL + D", hl.dsp.layout("rotatesplit"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.layout("swapsplit"))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "r-1" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ monitor = "left" }))
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ monitor = "right" }))
hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.window.move({ monitor = "left" }))
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ monitor = "right" }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = false }))

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q -n1 set 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q -n1 set 10%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("switch:on:Lid Switch", hl.dsp.dpms({ action = "off", monitor = "eDP-1" }), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.dpms({ action = "on", monitor = "eDP-1" }), { locked = true })
