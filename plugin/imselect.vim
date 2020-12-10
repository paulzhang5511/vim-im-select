if exists('g:loaded_vim_im_select') && g:loaded_vim_im_select
  finish
endif

let g:loaded_vim_im_select = 1

augroup im_select
  autocmd!
  autocmd InsertLeave * :call <SID>ChangeIME() 
augroup end

" 改变输入法为英文状态
function! s:ChangeIME() 
  call jobstart(system('im-select.exe 1033'))
endfunction

