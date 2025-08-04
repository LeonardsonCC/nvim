local candidates_root = vim.uv.os_getenv("SDKMAN_CANDIDATES_DIR")

vim.uv.os_setenv("JAVA_HOME", candidates_root .. "/java/24-amzn")

local get_parent_identifier = function(node_type, idx)
  local current_node = vim.treesitter.get_node()
  if not current_node then
    return ""
  end

  local class_node = current_node
  while class_node do
    local is_class_declaration = class_node:type() == node_type

    if is_class_declaration then
      break
    end
    class_node = class_node:parent()
  end

  if not class_node then
    return ""
  end

  local name_node = class_node:child(idx)
  if name_node and name_node:type() == "identifier" then
    return vim.treesitter.get_node_text(name_node, vim.api.nvim_get_current_buf())
  end
end

local get_function_name = function()
  return get_parent_identifier("method_declaration", 2)
end

local get_class_name = function()
  return get_parent_identifier("class_declaration", 2)
end

local get_package_name = function()
  return get_parent_identifier("package_declaration", 2)
end

local run_test = function(name)
  local java17 = candidates_root .. "/java/17.0.15-amzn"
  vim.cmd("term JAVA_HOME=" .. java17 .. " mvn clean test -Dtest=" .. name)
end

vim.g.get_parent_identifier = get_parent_identifier

vim.keymap.set("n", "<leader>tr", function()
  local test_name = get_class_name() .. "\\#" .. get_function_name()
  run_test(test_name)
end, { desc = "Run test nearest" })
vim.keymap.set("n", "<leader>tf", function()
  local test_name = get_class_name()
  run_test(test_name)
end, { desc = "Run test class" })
vim.keymap.set("n", "<leader>tp", function()
  local test_name = get_package_name()
  print("testname: " .. test_name)
  -- run_test(test_name)
end, { desc = "Run test package" })
