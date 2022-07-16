if has('nvim')
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
" Colorscheme {{{
Plug 'dracula/vim', { 'as': 'dracula' }
" }}}

" General {{{ 
Plug 'joeky888/Ass.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mg979/vim-visual-multi'
Plug 'preservim/vim-pencil'
Plug 'ron-rs/ron.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
" }}}

" Neovim {{{
if has('nvim')
  Plug 'folke/lsp-colors.nvim'
  Plug 'folke/lua-dev.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'kevinhwang91/nvim-ufo'
  Plug 'kevinhwang91/promise-async'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'numToStr/Comment.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'onsails/lspkind-nvim'
  Plug 'rcarriga/nvim-notify'
  Plug 'romgrk/barbar.nvim'
  Plug 'tami5/lspsaga.nvim'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'xiyaowong/nvim-transparent'
  Plug 'xiyaowong/virtcolumn.nvim'
endif
" }}}

" Vim {{{
if !has('nvim')
  Plug 'SirVer/ultisnips'
  Plug 'Yggdroot/indentLine'
  Plug 'dense-analysis/ale'
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'jayli/vim-easycomplete'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'machakann/vim-sandwich'
  Plug 'markonm/traces.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'preservim/vimux'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-flagship'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'tribela/vim-transparent'
endif
" }}}
call plug#end()

" vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
