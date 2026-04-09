local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    require("plugins.plugins"),
    { 'Pocco81/auto-save.nvim',opts = {} },
    { 'kylechui/nvim-surround',opts = {} },
    { 'nvim-lualine/lualine.nvim',
    	opts =
    		{options ={ theme="gruvbox_dark" }} },
    { 'quangnguyen30192/cmp-nvim-ultisnips' },
    { 'numToStr/Comment.nvim',opts={} },
    { 'm4xshen/autoclose.nvim',
    opts = {
    }},
    { 'nvim-telescope/telescope.nvim',opts = {}, dependencies = { 'nvim-lua/plenary.nvim' }},
    { 'is0n/jaq-nvim', opts =
    { cmds = {
	    external = {
		    python = "python %",
		    cpp = "c++ % -O3 --std=c++20 -o $fileBase  && ./$fileBase",
		    c = "gcc % -o $fileBase -lm && ./$fileBase",
		    javascript = "node %",
		    scheme = "racket %",
		    racket = "racket %",
		    lisp = "sbcl --load %",
		    haskell = "ghc % && ./$fileBase",
		    html = "firefox %",
		    java = "java %",
		    lua = "lua %",
		    go = "go run %",
            rust = "cargo run"
	    }
    },
    behavior = {
        default = "terminal"
    },
    ui = {
	    startinsert = true,
    } }},
    { 'sbdchd/neoformat' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'neovim/nvim-lspconfig' },
    { 'nvim-treesitter/nvim-treesitter',
    	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true
			}
	})
	end
     },
    { 'nvim-tree/nvim-web-devicons' },
    { 'lervag/vimtex', config = function()

	vim.g.tex_flavor = 'latex'
	vim.g.vimtex_quickfix_mode = 0
	vim.g.vimtex_view_method = 'zathura'
	vim.g.vimtex_compiler_progname = 'nvr'
	vim.g.vimtex_compiler_method = 'latexmk'
	vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-xelatex' }
	vim.g.tex_conceal = 'abdmg'

    end},
    { 'SirVer/ultisnips',config = function()
	    vim.g.UltiSnipsExpandTrigger = '<tab>'
	    vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
	    vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    end},
})


