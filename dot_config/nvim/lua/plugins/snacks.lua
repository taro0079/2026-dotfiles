return {
  "folke/snacks.nvim",
  keys = {
    { "<Space><Space>", false },
    {
      "<leader><Space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find",
    },
  },
}
