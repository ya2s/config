return {
  "phaazon/hop.nvim",
  branch = "v2",
  event = "VeryLazy",
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
