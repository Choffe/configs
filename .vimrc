call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'tomasiser/vim-code-dark'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

call plug#end()


colorscheme codedark

:inoremap jk <Esc>
:inoremap kj <Esc>

" Open fzf search
map <C-p> :Files<CR>

nnoremap <C-S-e> :NERDTree<CR>
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p