set nocompatible

call plug#begin('$HOME/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'" help fugitive
Plug 'tpope/vim-rhubarb'

" INTEGRATION TOOLS

augroup LastPositionJump
  autocmd! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

Plug 'w0rp/ale', {'for': ['python', 'sql', 'vim', 'bash', 'sh', 'javascript']}
  let g:ale_lint_on_text_changed='normal'
Plug 'Chiel92/vim-autoformat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'mattn/emmet-vim' " Expand html tags
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-grepper'
"Plug 'ekalinin/Dockerfile.vim', { 'for': ['dockerfile'] }

" javascript
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
" Linters
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [ 'javascript', 'css', 'json', 'markdown', 'yaml', 'html', 'python' ] }
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'epilande/vim-es2015-snippets'
"python
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'nvie/vim-flake8', {'for': ['python', 'sql' ]}
Plug 'davidhalter/jedi-vim', {'for': ['python', 'sql' ]}
Plug 'morhetz/gruvbox', {'for': ['python', 'sql', 'vim', 'bash', 'sh', 'javascript', 'html' ]}
"Plug 'tomlion/vim-solidity'
"
Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"==================================="
"======== PLUGINS MAPPING =========="
"==================================="
"
"===== jedi =====
let g:jedi#goto_stubs_command = "<leader>jg"
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
let jedi#force_py_version=3.7

"
"=========== Utils Snippet ========"
" Examples of use: insert mode: rfc<c-l>
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
""" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
""" disable preview window
""set completeopt-=preview
"let g:UltiSnipsEditSplit="vertical"
"nnoremap <leader>up :vsplit ~/.vim/plugged/vim-snippets/snippets/python.snippets<cr>

"====== Color gruvbox ======= "
let g:gruvbox_contrast_dark='dark'
colorscheme  gruvbox "python
syntax on
if g:colors_name == "gruvbox"
    highlight Normal ctermbg=16 guibg=#000000
    "List other overrides here
endif

"================ ACK =============="

map <leader>a :Ack! ""<Left>
if executable('ag')
    let g:ackprg ='ag --ignore yarn.lock --ignore node_modules --vimgrep '
endif

"================ FZF =============="
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~45%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --exclude=.git'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'



"========= Autoformat ========="
"au BufWrite * :Autoformat

"=========  ALE Plugin  ======="
"switch location list to quicklist view
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_list_window_size = 5
"" Set this. Airline will handle the rest.
"let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"run linters only when I saved
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_save = 1
" You can disable this option too
" if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 1
let g:ale_linters = {
            \ 'jsx': ['eslint'],
            \ 'javascript': ['eslint'],
            \ 'python': ['flake8']
            \}

let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
"let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --jsx-bracket-same-line true'
"let g:ale_fixers = {
            "\   '*': ['remove_trailing_lines', 'trim_whitespace'],
            "\   'html': ['prettier'],
            "\   'scss': ['prettier'],
            "\   'javascript': ['eslint'],
            "\   'bash': ['shellcheck']
            "\}

"let g:ale_echo_msg_format = '%linter%: %s (%code%)'

"let errorformat =
        "\ '%f:%l:%c: %trror: %m,' .
        "\ '%f:%l:%c: %tarning: %m,' .
        "\ '%f:%l:%c: %tote: %m'
""
"==========Emmet VIM==============="

"Current Key is <Ctrl> + Y
"Example: Ctrl + y ,
"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
            \  'javascript.jsx' : {
            \      'extends' : 'jsx'
            \  },
            \}


"-------- Prettier VIM -----------"

"let g:prettier#autoformat = 0
" print semicolons
" Prettier default: true
"let g:prettier#config#semi = 'false'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'
" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'
"The command :Prettier by default is synchronous but can also be forced async
let g:prettier#exec_cmd_async = 1
"execute Prettier on start
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.md Prettier

"remove autofocus after bug
let g:prettier#quickfix_auto_focus = 0

"------- DBUI -------- "
let g:db_ui_use_nerd_fonts=1



"========  lualine  ============
lua <<EOF
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require 'lualine'

-- Color table for highlights
local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {c = {fg = colors.fg, bg = colors.bg}},
      inactive = {c = {fg = colors.fg, bg = colors.bg}}
    }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function() return '▊' end,
  color = {fg = colors.blue}, -- Sets highlighting of component
  left_padding = 0 -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red
    }
    vim.api.nvim_command(
        'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" ..
            colors.bg)
    return ''
  end,
  color = "LualineMode",
  left_padding = 0
}

ins_left {
  -- filesize component
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then return '' end
      local sufixes = {'b', 'k', 'm', 'g'}
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format('%.1f%s', size, sufixes[i])
    end
    local file = vim.fn.expand('%:p')
    if string.len(file) == 0 then return '' end
    return format_file_size(file)
  end,
  condition = conditions.buffer_not_empty
}

ins_left {
  'filename',
  condition = conditions.buffer_not_empty,
  color = {fg = colors.magenta, gui = 'bold'}
}

ins_left {'location'}

ins_left {'progress', color = {fg = colors.fg, gui = 'bold'}}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = ' ', warn = ' ', info = ' '},
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {function() return '%=' end}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = {fg = '#ffffff', gui = 'bold'}
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  upper = true, -- I'm not sure why it's upper case either ;)
  condition = conditions.hide_in_width,
  color = {fg = colors.green, gui = 'bold'}
}

ins_right {
  'fileformat',
  upper = true,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = {fg = colors.green, gui = 'bold'}
}

ins_right {
  'branch',
  icon = '',
  condition = conditions.check_git_workspace,
  color = {fg = colors.violet, gui = 'bold'}
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = {added = ' ', modified = '柳 ', removed = ' '},
  color_added = colors.green,
  color_modified = colors.orange,
  color_removed = colors.red,
  condition = conditions.hide_in_width
}

ins_right {
  function() return '▊' end,
  color = {fg = colors.blue},
  right_padding = 0
}

-- Now don't forget to initialize lualine
lualine.setup(config)
EOF
