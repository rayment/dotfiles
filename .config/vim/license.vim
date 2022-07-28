" license.vim
" Dumps project licenses directly to a vim buffer
"

func! LoadLicense(forceinsert)
	let curline = line('.')
	call inputsave()

	let short = 0
	if a:forceinsert == 0
		let hdr = input('Insert a header? (Y/n): ')
		echo "\n"
		if len(hdr) == 0 || hdr[0] == 'y' || hdr[0] == 'Y'
			let short = 1
		else
			let short = 0
		endif
	endif

	echoc ""
	echoc "1. BSD 3-clause    (permissive)"
	echoc "2. GPL v3.0        (copyleft, programs)"
	echoc "3. LGPL v3.0       (copyleft, libraries)"
	let license = input('License? (1): ')
	if len(license) == 1
		if license[0] == '1'
			let filename = 'bsd3-clause'
		endif
		if license[0] == '2'
			let filename = 'gpl3.0'
		endif
		if license[0] == '3'
			let filename = 'lgpl3.0'
		endif
	else
		let filename = 'bsd3-clause'
	endif

	call inputrestore()

	let name = tolower(expand('%:t'))
	if name == 'makefile'
		let ext = 'makefile'
	else
		let ext = tolower(expand('%:e'))
	endif

	if short == 1
		execute "silent 0r !~/.config/vim/licenses/gen.sh " . filename . ' ' . ext
	else
		execute "silent 0r ~/.config/vim/licenses/" . filename
	endif

	" exe curline
endfun

