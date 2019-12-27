if exists('g:loaded_vim_im_select') && g:loaded_vim_im_select
  finish
endif

let g:loaded_vim_im_select = 1
let g:im_select_enable = 1 
let g:im_select_default_im = "1033"
let g:im_select_obtain_im_cmd = 'im-select.exe'
let g:im_select_switch_im_cmd = 'im-select.exe {im}'

augroup im_select
  autocmd!
  autocmd InsertLeave * :call <SID>CloseIME()
  autocmd InsertEnter * :call <SID>CloseIME()
augroup end

let g:insert_ime_mode_ = g:im_select_default_im

function! s:CloseIME()
  " echom g:im_select_enable
  if !g:im_select_enable
    return
  endif
  let g:insert_ime_mode_ = system(g:im_select_obtain_im_cmd)
  let l:cmd_ = substitute(
              \ g:im_select_switch_im_cmd,
              \ '{im}',
              \ g:im_select_default_im, 'g')
  " echom l:cmd_
  if g:insert_ime_mode_ != g:im_select_default_im
    call system(cmd_)
  endif
endfunction

function! s:RestoreIME()
    " echom g:im_select_enable
  if !g:im_select_enable
    return
  endif
  let l:cmd_ = substitute(
                \ g:im_select_switch_im_cmd,
                \ '{im}',
                \ g:insert_ime_mode_, 'g')
  " echom l:cmd_
  if g:insert_ime_mode_ != g:im_select_default_im
    call system(l:cmd_)
    let g:insert_ime_mode_ = g:im_select_default_im
  endif
endfunction

