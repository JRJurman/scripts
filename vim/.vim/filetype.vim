"
" include new syntax highlighting
"

augroup filetypedetect

au FileType markdown set nofoldenable
au FileType ruby setlocal shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.prom,*.prm,*.promela     setf promela
au BufNewFile,BufRead *.sj set filetype=javascript
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.scala set filetype=scala

augroup END
