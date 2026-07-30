return {
  { import = "lazyvim.plugins.extras.editor.snacks_explorer" },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["i"] = { "list_up", mode = "n" },
              ["k"] = { "list_down", mode = "n" },
              ["j"] = false,
            },
          },
          list = {
            keys = {
              ["i"] = "list_up",
              ["k"] = "list_down",
              ["j"] = false,
            },
          },
        },
        sources = {
          explorer = {
            hidden = true,
            win = {
              list = {
                keys = {
                  ["i"] = "list_up",
                  ["k"] = "list_down",
                  ["j"] = "explorer_close",
                  ["l"] = "confirm",
                },
              },
            },
          },
        },
      },
    },
  },
}
