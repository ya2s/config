local ok, _ = pcall(require, "nvim-surround")
if not ok then
  return
end

require("nvim-surround").setup()
