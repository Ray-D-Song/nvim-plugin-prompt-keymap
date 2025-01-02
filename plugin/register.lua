if vim.g.loaded_register then
  return
end
vim.g.loaded_register = true

require('register').setup()