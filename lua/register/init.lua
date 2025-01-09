-- module
local M = {}

-- store prompt and keymap
M.bucket = {}

--- Convert a table to a string
--- @param t table
--- @return string
local function table_to_string(t)
  if type(t) ~= "table" then return tostring(t) end
  
  local result = "{"
  for k, v in pairs(t) do
    if type(v) == "table" then
      result = result .. table_to_string(v) .. ", "
    else
      result = result .. tostring(v) .. ", "
    end
  end
  result = result:sub(1, -3) .. "}"
  return result
end

--- Fuzzy search for a prompt in the bucket
--- @param prompt string
--- @return table | nil
local function fuzzy_search(prompt)
  for k, v in pairs(M.bucket) do
    if k:find(prompt) then
      return v
    end
  end
end

function M.setup()
  vim.api.nvim_create_user_command('Prompt', function(opts)
    local result = fuzzy_search(opts.args)
    if result then
      print(table_to_string(result))
    else
      print('prompt not found')
    end
  end, { nargs = 1 })
end

--- Curried function for registering shortcuts
--- @param prompt string
--- @return function
function M.register(prompt)
  return function(mode, key, value, opts)
    M.bucket[prompt] = { mode, key, value, opts }
    return vim.api.nvim_set_keymap(mode, key, value, opts)
  end
end

--- Register all shortcuts in a table
--- @param t table
function M.register_all(t)
  for k, v in pairs(t) do
    M.register(k)(v)
  end
end

return M
