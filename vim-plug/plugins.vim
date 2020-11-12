call plug#begin('~/.config/nvim/autoload/plugged')

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " for Better Syntax
  Plug 'sheerun/vim-polyglot'

  " ESLint and Prettier
   " Plug 'w0rp/ale'
   
  " Git Entegration
  Plug 'airblade/vim-gitgutter'

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

  " Fast Comment Line Tool
  Plug 'preservim/nerdcommenter'
  
  " Tag Highlighter
  Plug 'Valloric/MatchTagAlways'

  " Close Tags
  Plug 'alvan/vim-closetag'

  " Session Management
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  
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
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  "Gruvbox Theme
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  " Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()
