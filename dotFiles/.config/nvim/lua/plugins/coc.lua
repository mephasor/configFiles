return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    build = "yarn install --frozen-lockfile",
    lazy = false,
    enabled = true,
    opts = {
      branch = "release",
      lazy = false,
    },
    config = function() end,
  },
}
