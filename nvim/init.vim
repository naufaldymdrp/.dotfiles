""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NaufaldyMDRP's Neovim Configuration """"""""""""""""
"""                                     """"""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
"" Start Internal Configuration ""
""""""""""""""""""""""""""""""""""

" change mapping to esc when in insert mode
inoremap kj <ESC>

" tabspace !!!
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
retab
set smarttab

" for showing syntax
syntax on
" for clearer colorscheme
colorscheme desert

set autoindent " autoindent
" filetype based on cpp file extension
autocmd Filetype cpp setlocal cindent cinoptions=g0 

set number " for showing line number

" for showing bottom cmd
set showcmd


let mapleader = "," " set leader key to COMMA
set laststatus=2 " for bottom line to show up

""""""""""""""""""""""""""""""""""
"" End Internal Configuration ""
""""""""""""""""""""""""""""""""""
" _____________________________________ "

"""""""""""""""""""""
"" Start Vim Source ""
"""""""""""""""""""""

source $XDG_CONFIG_HOME/nvim/vim_plug.vim
nnoremap <silent> <leader>so :source $MYVIMRC<CR>
nnoremap <silent> <leader><leader>v <C-v>

""""""""""""""""""""
"" End Vim Source ""
""""""""""""""""""""

" _____________________________________ "

filetype plugin indent on " turns on plugin indentation

" _____________________________________ "

""""""""""""""""""""""""""""
"" Start Colors and Theme ""
""""""""""""""""""""""""""""

"To show true colors on modern terminal
if (has('termguicolors'))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set t_Co=256
set cursorline " To show current cursor line
" let g:gruvbox_invert_selection='0'
colorscheme onedark
let g:onedark_termcolors=256
set background=dark

let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

"""""""""""""""""""""""""
"" End Colors and Theme ""
""""""""""""""""""""""""""

" _____________________________________ "

"""""""""""""""""""""""""
"" Start Lua LSPConfig ""
"""""""""""""""""""""""""

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
local custom_attach = function(client)
    require'completion'.on_attach(client)
    require'lsp_signature'.on_attach()

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(...)
    end

    -- options
    opts = { noremap=true, silent=true }

    -- go to declaration
    buf_set_keymap(0, 'n', 'gD', '<cmd> lua vim.lsp.buf.declaration()<CR>', opts)
    -- trigger hover
    buf_set_keymap(0, 'n', '<leader>i', '<cmd> lua vim.lsp.buf.hover()<CR>', opts)
end

require'lspconfig'.clangd.setup{}
require'lspconfig'.pyright.setup{ on_attach=custom_attach }
EOF

"""""""""""""""""""""""""
"" End Lua LSPConfig ""
"""""""""""""""""""""""""

" _____________________________________ "

" set rtp+=/usr/bin/fzf
" let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" command! -bang -nargs=? -complete=dir Files
"    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=default', '--preview', 'bat --color=always {}', '--preview-window=down']}, <bang>0)

" _____________________________________ "

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start Terminal Configuration 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <silent> <ESC> <C-\><C-n> " maps ESC key to escape terminal mode

" set terminal to buffer
nnoremap <silent> <leader><leader>1 :1Ttoggle<CR>
nnoremap <silent> <leader><leader>2 :2Ttoggle<CR>
nnoremap <silent> <leader><leader>3 :3Ttoggle<CR>
nnoremap <silent> <leader><leader>4 :4Ttoggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Terminal Configuration 
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" _____________________________________ "

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start telescope.nvim Mapping ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End telescope.nvim Mapping ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" _____________________________________ "

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start telescope.nvim Mapping ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for fzf.vim
" nnoremap <silent> <leader>f :Files<CR>
" nnoremap <silent> <leader>g :GFiles<CR>
" nnoremap <silent> <leader>b :Buffers<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End telescope.nvim Mapping ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" _____________________________________ "

"""""""""""""""""""""""""""""""
"  Start Configuration for nvim-lsp virtual text => To have a better virtual text position "
"""""""""""""""""""""""""""""""

luafile $XDG_CONFIG_HOME/nvim/nvim_lsp.lua
autocmd CursorMoved * :lua echo_diagnostic()

"""""""""""""""""""""""""""""""
"  End Configuration for nvim-lsp => To have a better virtual text position "
"""""""""""""""""""""""""""""""
" _____________________________________ "

