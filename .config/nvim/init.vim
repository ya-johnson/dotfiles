"""  vim-plug  """""
call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'Mofiqul/dracula.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'  
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()


"""""  neovim basics  """""
syntax enable
set title
set number
hi clear cursorline
hi clear cursorlineNR
hi lineNR ctermfg=13
hi link cursorline cursorcolumn
set cursorline
" set cursorcolumn
set nowrap
set linebreak
set showmode
set showcmd
" set cmdheight=2
set mouse=a
set mouse=v
set clipboard=unnamedplus

set splitbelow
set splitright

" tab
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4

" search
set showmatch
set hlsearch
set history=1000

" status line
set laststatus=0

"""""  colorscheme  """""
if has('termguicolors')
  set termguicolors
endif
set background=dark
colorscheme dracula



"""""  lualine  """""
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '●', right = '●'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END

let mapleader=" "

"""""  nerdtree  """""
let NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''
nnoremap <leader>n :NERDTreeToggle<CR>

"""""  telescope  """""

nnoremap <leader>f <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"""""  treesitter  """""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "tsx",
    "typescript",
    "svelte",
    "json",
    "html",
    "css",
    "scss",
    "bash",
    "vim"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF


"""""  keymapping  """""

" move between windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

nnoremap <Leader>q :bdelete<CR>
inoremap <Leader>c <esc>






