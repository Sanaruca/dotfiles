return {
  {
    "folke/snacks.nvim",
    dependencies = { "MaximilianLloyd/ascii.nvim" },
    opts = function(_, opts)
      if opts.dashboard then
        local ok, logo = pcall(function()
          return require("ascii").get_random_global()
        end)
        if ok and logo and #logo > 0 then
          opts.dashboard.preset.header = table.concat(logo, "\n")
        else
          opts.dashboard.preset.header = "Neovim"
        end
      end
    end,
  },
}
