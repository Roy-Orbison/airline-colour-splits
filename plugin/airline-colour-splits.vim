" A Vim plugin to make vertical splits automatically follow your Airline theme.
" © 2016-2021 Roy-Orbison.
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" https://github.com/Roy-Orbison/airline-colour-splits

function! AirlineColouriseSplits()
	if exists('g:airline#themes#{g:airline_theme}#palette.inactive.airline_a')
		let l:colours = g:airline#themes#{g:airline_theme}#palette.inactive.airline_a
		if !empty(l:colours)
			call airline#highlighter#exec('VertSplit', [l:colours[1], l:colours[1], l:colours[3], l:colours[3]])
			call airline#highlighter#exec('StatusLine', l:colours)
			call airline#highlighter#exec('StatusLineNC', l:colours)
		endif
	endif
endfunction

augroup AirlineColourSplits
	autocmd!
	autocmd User AirlineAfterInit,AirlineAfterTheme call AirlineColouriseSplits()
augroup END
