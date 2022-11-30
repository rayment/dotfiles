" statusline.vim
" Creates a useful statusline.
"

function GitBranch()
	return trim(system("git -C " . expand("%:h") . " branch --show-current 2>/dev/null"))
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

