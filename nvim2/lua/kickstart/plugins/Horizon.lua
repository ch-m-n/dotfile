return {
  'akinsho/horizon.nvim',
  opts = {
    overrides = {
      colors = {
        CursorLine = { bg = '#1e1e1e', fg = '#ffffff', underline = true },
      },
    },
    plugins = {
      cmp = true,
      indent_blankline = true,
      nvim_tree = true,
      telescope = true,
      which_key = true,
      barbar = true,
      notify = true,
      symbols_outline = true,
      neo_tree = true,
      gitsigns = true,
      crates = true,
      hop = true,
      navic = true,
      quickscope = true,
      flash = true,
    },
  },
}

