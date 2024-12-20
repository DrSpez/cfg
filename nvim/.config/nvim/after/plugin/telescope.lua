require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
    },
}

local builtin = require('telescope.builtin')


vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope fuzzy search through output of git ls-files. Respects .gitignore' })
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Grep in the project directory. Requires ripgrep installation.' })
