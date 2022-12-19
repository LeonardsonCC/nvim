local M = {}

M.setup = function()
  local duck = require("duck")

  duck.setup({
    hatch_location = 'random',
  })

  M.duck = duck

  _G.duck_spawner = vim.loop.new_timer()
  _G.duck_killer = vim.loop.new_timer()

  -- Randomly spawns duck
  vim.api.nvim_create_user_command("DuckSpawner", function(opts)
    local animal = opts.fargs[1] or "🦆"
    M.duck_spawner(animal)
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("DuckKiller", function()
    if M.duck.ducks_list[1] ~= nil then
      M.duck.cook()
    end
    _G.duck_spawner:stop()
    _G.duck_killer:stop()
  end, {})

  -- Simple commands to make easier hatch and cook ducks
  vim.api.nvim_create_user_command("Duck", function(opts)
    local animal = opts.fargs[1] or "🦆"
    duck.hatch(animal, 10)
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("Ducks", function(opts)
    local number = tonumber(opts.fargs[1])
    if number < 1 then
      print("Error: number must be at least 1")
      return
    end

    local animal = opts.fargs[2] or "🦆"

    for _ = 1, number do
      duck.hatch(animal, 10)
    end
  end, { nargs = "+" })

  vim.api.nvim_create_user_command("CookDuck", function()
    duck.cook()
  end, {})

  vim.api.nvim_create_user_command("CookDucks", function()
    for _, _ in pairs(duck.ducks_list) do
      vim.schedule(function()
        duck.cook()
      end)
    end
  end, {})
end


M.duck_spawner = function(animal)
  _G.duck_spawner:start(
    0,
    10000,
    vim.schedule_wrap(function()
      M.duck.hatch(animal, 10)
    end)
  )
  _G.duck_killer:start(
    5000,
    10000,
    vim.schedule_wrap(function()
      if M.duck.ducks_list[1] ~= nil then
        M.duck.cook()
      end
    end)
  )
end

return M

