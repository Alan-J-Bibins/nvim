return{
     'Everblush/nvim', name = 'everblush',
     config = function()
         require('everblush').setup()
         vim.cmd.colorscheme "everblush"
     end,
 }
