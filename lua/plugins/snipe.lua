return {
    {
        "leath-dub/snipe.nvim",
        keys = {
            { ";", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
        },
        config = function()
            require('snipe').setup({
                ui = {
                    position = "topleft",
                    open_win_override = {
                        border = "rounded"
                    },
                    preselect_current = true,
                    text_align = "file-first",
                },
                hints = {
                    -- dictionary = "sadflewcmpghio",
                    dictionary = "asdflewcmpghio",
                },
            })
        end
    },
}
