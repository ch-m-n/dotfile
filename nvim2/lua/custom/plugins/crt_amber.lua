return {
  'foxbunny/vim-amber',
  event = 'BufEnter',
  config = function()
    vim.cmd 'colorscheme amber'
  end,
}
