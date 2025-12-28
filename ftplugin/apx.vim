" ApX filetype plugin
" Settings for .apx files

" Comments (gcc works with Comment.nvim)
setlocal commentstring=#\ %s
setlocal comments=:#

" Quick comment toggle with <leader>/
nnoremap <buffer> <leader>/ :s/^/# /<CR>:noh<CR>
vnoremap <buffer> <leader>/ :s/^/# /<CR>:noh<CR>

" Indentation
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

" Folding (by indent)
setlocal foldmethod=indent
setlocal foldlevel=99

" Match pairs
setlocal matchpairs+=<:>

" Don't wrap long lines
setlocal nowrap

" Keyword characters (for w/b motions)
setlocal iskeyword+=-
setlocal iskeyword+=$
