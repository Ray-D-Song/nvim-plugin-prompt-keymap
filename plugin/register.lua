if vim.g.loaded_register then
  return
end
vim.g.loaded_register = true

vim.schedule(function()
  require('register').setup()
end)