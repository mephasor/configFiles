return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
    })
  end,
  keys = {
    -- set keymaps
   { "\\", "<cmd>Neotree toggle current reveal_force_cwd<cr>", desc = "NeoTree current folder" },
   { "|", "<cmd>Neotree reveal<cr>", desc = "NeoTree project home" },
  }
}
