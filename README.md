# Font syntax files for Vim

This is [Vim](http://www.vim.org) syntax description files for various font development source formats.

![OpenType Feature-file in Vim](https://rawgithub.com/clauseggers/vim-fontsyntax/master/images/screenshot.png)

The supported formats are [UFO](http://unifiedfontobject.org) (XML), [TTX](https://github.com/behdad/fonttools/) (XML, Assembly), and [OpenType features](https://www.adobe.com/devnet/opentype/afdko.html).

As for the UFO, the supplied Vim syntax file is for the `foo.glif` files.

The `glif.vim` file is not strictly speaking necessary since the content of glif-files is XML, and Vim will automatically detect this, but it is included here for completeness The `glif.vim` simply contains a command to set the filetype to XML.

The `ttx.vim` file contain commands to set the syntax to XML and Assembly. If you need more specific Assembly highlighting you can add it to this file.

The `fea.vim` file supports highlighting of features, keywords, numbers, structures, lookups, groups, tables†, subtables and comments. This enables Vim to correctly indent and fold Feature-files.

†The OpenType Features syntax file is currently limited to support only the most common tables. If you require specific support of more exotic tables I suggest that you extend on the existing file by using the existing tables as templates.

### Extensions on these files
If you make useful extensions on these files, please send a pull request to this Github repo.

### Installation
1) Clone or download these files.

2) Copy or link the files in the `syntax` folder to `~/.vim/syntax/` on UNIX systems, or to `$HOME/vimfiles/syntax/` on Windows systems.

3) Copy or link the files in the `ftdetect` folder to `~/.vim/ftdetect/` on UNIX systems, or to `$HOME/vimfiles/ftdetect/` on Windows systems.

4) Start or re-start Vim.

In the folder `sample_feature_file` exists a sample Feature-file.

### License
These files are licensed under the [Vim license](http://vimdoc.sourceforge.net/htmldoc/uganda.html).

