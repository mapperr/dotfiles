" toggle search highlight
nnoremap <silent> <Leader>h :set hlsearch!<CR>
" toggle paste
nnoremap <silent> <Leader>p :set paste!<CR>
" neoranger
" https://vimawesome.com/plugin/neoranger
" Open ranger at current file with "-"
map <F2> :RangerCurrentFile<CR>
" Open ranger in current working directory
" nnoremap <silent> <Leader>r :Ranger<CR>
" tagbar
nmap <F3> :TagbarToggle<CR>
" AutoFormat
noremap <F4> :Autoformat<CR>
" syntastic
nnoremap <Leader>sS :SyntasticToggleMode<CR>
nnoremap <Leader>ss :SyntasticCheck<CR>
nnoremap <Leader>se :Errors<CR>
nnoremap <Leader>sr :SyntasticReset<CR>
" youcompleteme ycm
nnoremap <Leader>g :YcmCompleter GoTo<CR>
nnoremap <Leader>o :YcmCompleter OrganizeImports<CR>
nnoremap <Leader>d :YcmCompleter GetDoc<CR>
" fzf
nnoremap <Leader>f :call fzf#run({'source': 'fd .', 'sink': 'e'})<CR>
" nnoremap <Leader>d :call fzf#run({'source': 'fd . `git rev-parse --show-toplevel`', 'sink': 'e'})<CR>
nnoremap <leader>t :terminal<CR>:setlocal nonumber<CR>:setlocal norelativenumber<CR>:startinsert<CR>

