hl.window_rule({
  match = {
    class = "steam",
    title = "Friends List|Steam Settings",
  },
  float = true,
  center = true,
  min_size = { 1024, 576 },
  size = { 1024, 576 },
})

hl.window_rule({
  match = {
    class = "org.pulseaudio.pavucontrol",
  },
  float = true,
  center = true,
  min_size = { 1024, 576 },
  size = { 1024, 576 },
})

hl.window_rule({
  match = {
    class = "^(impala|bluetui)$",
  },
  float = true,
  center = true,
  min_size = { 896, 504 },
  size = { 896, 504 },
})

hl.window_rule({
  match = {
    class = "nemo",
  },
  float = true,
  center = true,
  min_size = { 896, 504 },
  size = { 1280, 720 },
})
