return {
    {
        "07CalC/cook.nvim",
        config = function()
            require("cook").setup({
                runners = {
                    py = "'python3 %s'",
                    c = "'gcc %s -o %s && .%s'",
                    cpp = "'g++ %s -o %s && .%s'",
                    rs = "'cargo run'",
                    js = "'node %s'",
                    ts = "'node %s'",
                    go = "'go run %s'",
                }
            })
            vim.keymap.set('n', '<leader>cS', '<CMD>Cook<CR>', { desc = "Start COOKing" })
        end,
        cmd = "Cook",
    },
    {
        'rareitems/printer.nvim',
        config = function()
            require('printer').setup({
                keymap = "gp", -- Plugin doesn't have any keymaps by default
                formatters = {
                    -- you can define your formatters for specific filetypes
                    -- by assigning function that takes two strings
                    -- one text modified by 'add_to_inside' function
                    -- second the variable (thing) you want to print out
                    -- see examples in lua/formatters.lua
                    lua = function(text_inside, text_var)
                        return string.format("print([[%s = ]] .. %s)", text_inside, text_var)
                        -- for nvim stuff
                        -- return string.format('print([[%s: ]] .. vim.inspect(%s))', text_inside, text_var)
                    end,

                    python = function(text_inside, text_var)
                        return string.format('print("%s =", %s)', text_inside, text_var)
                    end,

                    javascript = function(text_inside, text_var)
                        return string.format('console.log("%s = ", %s)', text_inside, text_var)
                    end,

                    typescript = function(text_inside, text_var)
                        return string.format('console.log("%s = ", %s)', text_inside, text_var)
                    end,

                    typescriptreact = function(text_inside, text_var)
                        return string.format('console.log("%s = ", %s)', text_inside, text_var)
                    end,

                    go = function(text_inside, text_var)
                        return string.format('fmt.Println("%s = ", %s)', text_inside, text_var)
                    end,

                    vim = function(text_inside, text_var)
                        return string.format('echo "%s = ".%s', text_inside, text_var)
                    end,

                    rust = function(text_inside, text_var)
                        return string.format([[println!("%s = {:#?}", %s);]], text_inside, text_var)
                    end,

                    zsh = function(text_inside, text_var)
                        return string.format('echo "%s = $%s"', text_inside, text_var)
                    end,

                    bash = function(text_inside, text_var)
                        return string.format('echo "%s = $%s"', text_inside, text_var)
                    end,

                    sh = function(text_inside, text_var)
                        return string.format('echo "%s = $%s"', text_inside, text_var)
                    end,

                    java = function(text_inside, text_var)
                        return string.format('System.out.println("%s = " + %s);', text_inside, text_var)
                    end,

                    cs = function(text_inside, text_var)
                        return string.format(
                            'System.Console.WriteLine("%s = " + %s);',
                            text_inside,
                            text_var
                        )
                    end,

                    cpp = function(text_inside, text_var)
                        return string.format(
                            'std::cout << "%s = " << %s << std::endl;',
                            text_inside,
                            text_var
                        )
                    end,

                    ruby = function(inside, variable)
                        return string.format('pp "%s = ", %s', inside, variable)
                    end,
                },
            })
        end
    }
}
