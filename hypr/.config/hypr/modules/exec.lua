hl.on("hyprland.start", function()
  -- Authentication
  hl.exec_cmd("systemctl --user start hyprpolkitagent.service")

  -- Desktop shell
  hl.exec_cmd("quickshell")

  -- Wallpaper
  hl.exec_cmd("awww-daemon")

  -- Idle management and color temperature
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprsunset")

  -- Clipboard persistence
  hl.exec_cmd("wl-clip-persist --clipboard regular")
end)
