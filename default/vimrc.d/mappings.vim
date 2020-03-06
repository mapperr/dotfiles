" toggle search highlight
nnoremap <silent> <Leader>h :set hlsearch!<CR>
" toggle paste
nnoremap <silent> <Leader>P :set paste!<CR>
" close preview window
nnoremap <silent> <Leader>p :pc<CR>
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
nnoremap <Leader>G :YcmCompleter GoToReferences<CR>
nnoremap <Leader>o :YcmCompleter OrganizeImports<CR>
nnoremap <Leader>d :YcmCompleter GetDoc<CR>
nnoremap <Leader>F :YcmCompleter FixIt<CR>
" fzf
nnoremap <Leader>f :call fzf#run({'source': 'fd .', 'sink': 'e'})<CR>
" nnoremap <Leader>d :call fzf#run({'source': 'fd . `git rev-parse --show-toplevel`', 'sink': 'e'})<CR>
nnoremap <leader>t :terminal<CR>:setlocal nonumber<CR>:setlocal norelativenumber<CR>:startinsert<CR>
" denite
nmap <leader>b :Denite buffer -split=floating -winrow=1<CR>
"nmap <leader>df :DeniteProjectDir file/rec<CR>
nnoremap <leader>rg :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>rr :<C-u>DeniteCursorWord grep:.<CR>

" https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
