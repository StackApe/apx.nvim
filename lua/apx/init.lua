-- apx.nvim - ApX Language Support for Neovim
-- Maintainer: Stack Ape Academy
-- License: MIT

local M = {}

-- Default configuration
M.config = {
  -- Path to apx executable (nil = use PATH)
  apx_path = nil,
  -- Path to apx-lsp executable (nil = use PATH)
  lsp_path = nil,
  -- Enable LSP (requires apx-lsp in PATH or lsp_path set)
  lsp = true,
  -- Keymaps (set to false to disable)
  keymaps = {
    run_file = "<leader>ar",    -- Run current file
    run_line = "<leader>al",    -- Run current line
  },
}

-- Setup function for lazy.nvim / packer configuration
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  -- Set up keymaps if enabled
  if M.config.keymaps then
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "apx",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()

        if M.config.keymaps.run_file then
          vim.keymap.set("n", M.config.keymaps.run_file, function()
            M.run_current_file()
          end, { buffer = bufnr, desc = "ApX: Run current file" })
        end

        if M.config.keymaps.run_line then
          vim.keymap.set("n", M.config.keymaps.run_line, function()
            M.run_current_line()
          end, { buffer = bufnr, desc = "ApX: Run current line" })
        end
      end,
    })
  end

  -- Set up LSP if enabled
  if M.config.lsp then
    M.setup_lsp()
  end
end

-- Set up the ApX language server
function M.setup_lsp()
  local lsp_cmd = M.config.lsp_path or "apx-lsp"

  -- Check if apx-lsp exists
  if vim.fn.executable(lsp_cmd) ~= 1 then
    vim.notify(
      "apx-lsp not found. Install it or set lsp_path in config.\nDisable with: require('apx').setup({ lsp = false })",
      vim.log.levels.WARN
    )
    return
  end

  -- Register with vim.lsp
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "apx",
    callback = function(args)
      vim.lsp.start({
        name = "apx-lsp",
        cmd = { lsp_cmd },
        root_dir = vim.fs.dirname(vim.fs.find({ ".git", "apx.profile" }, { upward = true })[1])
          or vim.fn.getcwd(),
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })
    end,
  })
end

-- Get the apx executable path
function M.get_apx_cmd()
  return M.config.apx_path or "apx"
end

-- Run the current file
function M.run_current_file()
  local file = vim.fn.expand("%:p")
  if file == "" then
    vim.notify("No file to run", vim.log.levels.WARN)
    return
  end

  local cmd = M.get_apx_cmd() .. " prime " .. vim.fn.shellescape(file)

  -- Open terminal with the command
  vim.cmd("split | terminal " .. cmd)
end

-- Run the current line
function M.run_current_line()
  local line = vim.api.nvim_get_current_line()
  if line == "" or line:match("^%s*#") then
    vim.notify("Empty or comment line", vim.log.levels.WARN)
    return
  end

  M.eval(line)
end

-- Evaluate an ApX expression
function M.eval(expr)
  local cmd = M.get_apx_cmd() .. " -c " .. vim.fn.shellescape(expr)

  local output = vim.fn.system(cmd)
  local exit_code = vim.v.shell_error

  if exit_code ~= 0 then
    vim.notify("ApX Error:\n" .. output, vim.log.levels.ERROR)
  else
    if output ~= "" then
      vim.notify(output, vim.log.levels.INFO)
    end
  end
end

return M
