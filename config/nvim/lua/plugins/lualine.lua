return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "powerline_dark",
        component_separators = {left = "|", right = "|"},
        section_separators = {left = "", right = ""},
        disabled_filedtypes = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
      },
      inactive_sections = {},
      tabline = {},
      extensions = {}
    }
  end 
}
