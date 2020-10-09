call plug#begin('~/.config/nvim/autoload/plugged')

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " for Better Syntax
  Plug 'sheerun/vim-polyglot'

  " ESLint and Prettier
  Plug 'w0rp/ale'

  "NERDTree
  Plug 'preservim/nerdtree'
  " Icons
  Plug 'ryanoasis/vim-devicons'

  " Emeet for Better HTML
  Plug 'mattn/emmet-vim'

  " File Search with FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Word Search with Ack
  Plug 'mileszs/ack.vim'

  " Tag Highlighter
  Plug 'Valloric/MatchTagAlways'

  " Close Tags
  Plug 'alvan/vim-closetag'

  " React Snippets -----------------------------------------------------------
  Plug 'mlaursen/vim-react-snippets'

  "Auto Paranthesis Padding
  Plug 'jiangmiao/auto-pairs'

  " Whichkey
  "Plug 'liuchengxu/vim-which-key'
  " On-demand lazy load
  "Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

  " Intellisense with coc
  " Use release branch (recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "Gruvbox Theme
  Plug 'morhetz/gruvbox'

call plug#end()
