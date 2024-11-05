return {
    'Shatur/neovim-ayu',
    name = 'ayu',
    priority = 1000,
    config = function()
        require('ayu').setup {
            mirage = false,
            terminal = true,
            overrides = {},
        }
    end,
}
