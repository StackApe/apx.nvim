" apx.nvim - ApX Language Support for Neovim
" Maintainer: Stack Ape Academy
" License: MIT

if exists('g:loaded_apx')
  finish
endif
let g:loaded_apx = 1

" Register the filetype (backup if ftdetect doesn't run first)
augroup ApxFiletype
  autocmd!
  autocmd BufRead,BufNewFile *.apx,*.apxrc setfiletype apx
  autocmd BufRead,BufNewFile apx.profile setfiletype apx
augroup END

" Commands
command! ApxRun lua require('apx').run_current_file()
command! ApxRunLine lua require('apx').run_current_line()
command! -nargs=1 ApxEval lua require('apx').eval(<q-args>)
