" Vim syntax file
" Language: 			 FontTools XML
" Maintainer: 		 Claus Eggers Sørensen <clauses@gmail.com>
" URL: 						 http://www.github.com/clauseggers/vim-fontsyntax
" Version: 				 0.01
" Latest Revision: 6 July 2015

" Include the XML syntax
if !exists("b:current_syntax")
  runtime! syntax/xml.vim
endif

" Add assembler highlighting for the <assembly>
let s:current_syntax=b:current_syntax
unlet b:current_syntax
syntax include @asm syntax/asm.vim
syntax region asmRegion start="<assembly>" end="</assembly>" contains=@asm
let b:current_syntax=s:current_syntax
