call pathogen#infect()

:let maplocalleader = "\\"
"Basic settings
syntax on
filetype plugin indent on
set nocompatible
set number
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set background=dark
set laststatus=0
set clipboard=unnamed
colo darkblue
hi Keyword ctermfg=darkcyan
hi Constant ctermfg=5*
hi Comment ctermfg=2*
hi Normal ctermbg=none
hi LineNr ctermfg=darkgrey

"Open NERDTree when nvim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>

"Show hidden files in NERDTree
let NERDTreeShowHidden=1


"Use Grepper
nnoremap <leader>ga :Grepper<cr>
nnoremap <leader>gb :Grepper -buffer<cr>





"haskell-vim syntax
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2


"Intero

" Automatically reload on save
au BufWritePost *.hs InteroReload

" Lookup the type of expression under the cursor
"au FileType haskell nmap <silent> <leader>t <Plug>InteroGenericType
"au FileType haskell nmap <silent> <leader>T <Plug>InteroType
" Insert type declaration
au FileType haskell nnoremap <silent> <leader>ni :InteroTypeInsert<CR>
" Show info about expression or type under the cursor
au FileType haskell nnoremap <silent> <leader>i :InteroInfo<CR>

" Open/Close the Intero terminal window
au FileType haskell nnoremap <silent> <leader>nn :InteroOpen<CR>
au FileType haskell nnoremap <silent> <leader>nh :InteroHide<CR>

" Reload the current file into REPL
au FileType haskell nnoremap <silent> <leader>nf :InteroLoadCurrentFile<CR>
" Jump to the definition of an identifier
au FileType haskell nnoremap <silent> <leader>ng :InteroGoToDef<CR>
" Evaluate an expression in REPL
au FileType haskell nnoremap <silent> <leader>ne :InteroEval<CR>

" Start/Stop Intero
au FileType haskell nnoremap <silent> <leader>ns :InteroStart<CR>
au FileType haskell nnoremap <silent> <leader>nk :InteroKill<CR>

" Reboot Intero, for when dependencies are added
au FileType haskell nnoremap <silent> <leader>nr :InteroKill<CR> :InteroOpen<CR>

" Managing targets
" Prompts you to enter targets (no silent):
au FileType haskell nnoremap <leader>nt :InteroSetTargets<CR>

" Ctrl-{hjkl} for navigating out of terminal panes
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"Terminal keybinding
nnoremap <silent> <leader>tm :split <bar> terminal

"Call Neomake
"Disabled for now using ALE>>>call neomake#configure#automake('w')

"Auto open windows with make issues
let g:neomake_open_list = 2
"Disable neomake markers to only have itero markers
let g:neomake_haskell_enabled_makers = []

"ghc-mod
au FileType haskell nmap <leader>mc :GhcModSplitFunCase<CR>
au FileType haskell nmap <leader>ms :GhcModSigCodegen<CR>


"Hindent and stylishask to pretty print format code. Manual run

let g:hindent_on_save = 0
au FileType haskell nnoremap <silent> <leader>ph :Hindent<CR>

let g:stylishask_on_save = 0
au FileType haskell nnoremap <silent> <leader>ps :Stylishask<CR>


"Tabular 
"Align character in multiple rows
nnoremap <leader>= :Tabularize /=<CR>
nnoremap <leader>- :Tabularize /-><CR>
nnoremap <leader>, :Tabularize /,<CR>
nnoremap <leader># :Tabularize /#-}<CR>


au FileType haskell nnoremap <silent> <leader>ims :HsimportSymbol<CR>
au FileType haskell nnoremap <silent> <leader>imm :HsimportModule<CR>

" Use deoplete. General framework completions
let g:deoplete#enable_at_startup = 1


"Supertab to completions with tab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'


"Fill autocomplete with Haskell options
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0

" neco-ghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc 
let g:necoghc_enable_detailed_browse = 1


" Python "
let g:python3_host_prog = "$HOME/anaconda3/bin/python3"
let g:python_host_prog = "/usr/bin/python2"

" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', { '_': ['ale'],})

let g:ale_fixers = {'python': ['black']}
let g:ale_fix_on_save = 1
let g:ale_linters = {'python': ["pylint", "mypy"]}


" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>gc"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = "<leader>gd"


" Debugger"

let g:vimspector_enable_mappings = 'Human'

let g:vimspector_base_dir=expand( '$HOME/.config/nvim/bundle' )

nmap <leader>rn :call vimspector#Launch()
nmap <leader>rs :call vimspector#Restart()
nmap <leader>ev :VimspectorEval
nmap <leader>wt :VimspectorWatch
nmap <leader>so :VimspectorShowOutput
nmap <leader>bp :call vimspector#ToggleBreakpoint()
nmap <leader>bf :call vimspector#AddFunctionBreakpoint()
nmap <leader>st :call vimspector#StepOver()
nmap <leader>si :call vimspector#StepInto()
nmap <leader>so :call vimspector#StepOut()
nmap <leader>vp :call vimspector#Pause()
nmap <leader>vs :call vimspector#Stop()
nmap <leader>ct :call vimspector#Continue()
nmap <leader>rr :VimspectorReset

"JAVA"
"
" Tell YCM where to find the plugin. Add to any existing values.
let g:ycm_java_jdtls_extension_path = [
  \ '/home/mtmccart/.config/nvim/bundle/vimspector/gadgets/linux'
  \ ]

let s:jdt_ls_debugger_port = 0
function! s:StartDebugging()
  if s:jdt_ls_debugger_port <= 0
    " Get the DAP port
    let s:jdt_ls_debugger_port = youcompleteme#GetCommandResponse(
      \ 'ExecuteCommand',
      \ 'vscode.java.startDebugSession' )

    if s:jdt_ls_debugger_port == ''
       echom "Unable to get DAP port - is JDT.LS initialized?"
       let s:jdt_ls_debugger_port = 0
       return
     endif
  endif

  " Start debugging with the DAP port
  call vimspector#LaunchWithSettings( { 'DAPPort': s:jdt_ls_debugger_port } )
endfunction

nmap <leader>ra :call <SID>StartDebugging()<CR>


" Disable auto-detection of virtualenvironments
let g:ale_virtualenv_dir_names = []
" Environment variable ${VIRTUAL_ENV} is always used
"
let g:ale_python_pylint_change_directory=0
let g:ale_python_flake8_change_directory=0
let g:ale_python_auto_pipenv = 1


" Remap escape to exit terminal
:tnoremap <Esc> <C-\><C-n>:buffer #<CR>
