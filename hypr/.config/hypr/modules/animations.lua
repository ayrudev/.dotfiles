hl.curve("instantOut", { type = "bezier", points = { { 0, 1 }, { 0, 1 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })

hl.curve("springy", { type = "spring", mass = 1, stiffness = 2, dampening = 0.6 })

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "easeOutExpo", style = "gnomed" })
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "easeOutExpo", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "easeOutExpo", style = "fade" })
