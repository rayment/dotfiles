" makefile.vim
" Dumps project makefiles directly to a vim buffer
"

func! LoadMakefile()
	call inputsave()

	echoc ""
	echoc "1. C/C++           (hybrid, programs)"
	echoc "2. C/C++           (hybrid, libraries)"
	echoc "3. C/C++           (lex+yacc, parsers)"
	let license = input('Project type? (1): ')
	let particle = 'c_prog'
	if len(license) == 1
		if license[0] == '1'
			let particle = 'c_prog'
		endif
		if license[0] == '2'
			let particle = 'c_lib'
		endif
		if license[0] == '3'
			let particle = 'c_lexyacc'
		endif
	endif

	call inputrestore()

	execute "silent 0r ~/.config/vim/makefiles/Makefile." . particle
	execute "silent 0r !~/.config/vim/templates/makefile.py %"
endfun

