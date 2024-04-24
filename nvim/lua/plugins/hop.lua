return {
  "smoka7/hop.nvim",
  version = "*",
  event = "VeryLazy",
  cond = true,
  keys = {
    {
      "s",
      function()
        require("hop").hint_words()
      end,
    },
  },
  config = true,
}
