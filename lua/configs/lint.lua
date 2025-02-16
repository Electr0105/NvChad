local lint = require("link")

lint.linters_by_ft = {
  lua = { "luacheck" },
  python = { "flake8" },
}

lint.linters.luacheck.args = {
  "--globals",
  "love",
  "vim",
  "--formatter",
  "plain",
  "--codes",
  "--ranges",
  "-"
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "IntertLeave"}, {
  callback = function()
      lint.try_lint()
  end,
})
