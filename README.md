## dotfiles - my custom configs

### including
- .vim/vimrc
- nvim config
- .zlogin .zshrc(with oh-my-zsh) .zshrc.laptop
- .gitconfig
- .xprofile .Xresources .pam_environment
- .fehbg
- .config
    - alacritty
    - bat
    - conky
    - delta
    - dunst
    - espanso
    - i3
    - picom
    - polybar
    - ranger
    - redshift
    - rofi
    - surfingkeys
    - kitty
    - mako
    - mpv
    - sway
    - waybar
- .fzf.zsh - fzf config
- .func.zsh - custom shell functions
- .gdbinit - gdb-dashboard

### [n]vim-reference

| mode     | keybinding                  | action                                                  |
|----------|-----------------------------|---------------------------------------------------------|
| help     | \<C-]\>                     | jump to link                                            |
| normal   | ct                          | join two lines                                          |
|          | gJ                          | join two withoutspace                                   |
|          | U                           | line undo (act as a change, not undo)                   |
|          | * #                         | search current word                                     |
|          | i I a A o O                 | enter insert mode                                       |
|          | w b e ge                    | word jump                                               |
|          | W B E gE                    | word jump separated by blanks                           |
|          | { }                         | paragraph jump                                          |
|          | << >>                       | remove/add indent                                       |
|          | <{obj} >{obj}               | indent for object                                       |
|          | \<C-s\> \<C-e\>             | goto start end of line                                  |
|          | gj gk                       | move up/down in wrapped line                            |
|          | f F t T ; ,                 | find reverse-find to reverse-to repeat reverse-repeat   |
|          | [[ ][ [] ]]                 | jump to function start/end                              |
|          | [x ]y                       | jump to pair xy                                         |
|          | \<C-UD\>                    | scroll halfscreen                                       |
|          | '' \<C-o\> \<C-i\>(\<TAB\>) | jump backward or forward                                |
|          | 'x mx                       | mark and jump to mark (capital for global marks)        |
|          | .                           | repeat change                                           |
|          | " q @                       | register (capital for append)                           |
|          | S s                         | split window                                            |
|          | g~ gu gU g~~ guu gUU        | case change                                             |
|          | gf                          | goto file                                               |
|          | gv                          | repeat visual select                                    |
|          | zz zt zb                    | move current line to middle/top/bottom of screen        |
|          | zc zo zuz                   | fold unfold update-fold                                 |
|          | zr zm zR zM                 | reduce/more fold, reduce/more all fold                  |
|          | zn zN zi                    | open/close all fold temporarily, and toggle             |
| visual   | ~ u U                       | case change                                             |
|          | \< \>                       | shift block                                             |
| command  | \<C-HL\> \<C-FB\> \<C-SE\>  | move forward/backward char/word start/end               |
|          | \<C-JK\>                    | history forward/backward                                |
|          | \<C-WU\>                    | delete word/till line start                             |
|          | \<C-D\>                     | show completion list                                    |
|          | /pattern/{num,b,e} ?        | search p                                                |
|          | {num},{num}                 | line ranger: can use: % ^ . $ + - ? / '                 |
|          | {num}:                      | equal to :.,.+{num-1}                                   |
|          | s/pattern/replace/gc        | search and replace                                      |
|          | g/pattern/command/gc        | search and run command                                  |
|          | \< \> \{num}                | use them in pattern                                     |
|          | !                           | filter                                                  |
|          | :m {num}                    | move current line after line {num}                      |
| insert   | \<C-A\>                     | insert again                                            |
|          | \<C-R\> x                   | paste register x                                        |
|          | \<C-O\>                     | temp normal command                                     |
|          | \<C-D\> \<C-T\>             | remove/add indent                                       |
| plugins  | gd gc gt gr                 | ycm goto                                                |
|          | tt                          | nerd tree toggle                                        |
|          | \<LEADER\>tm                | table mode toggle                                       |
|          | \<LEADER\>tt                | table mode format selected lines                        |
|          | \<LEADER\>tdd tdc           | table mode delete row or line                           |
|          | \<LEADER\>tic tiC           | table mode insert column after or before                |
|          | [\| ]\| {\| }\|             | table mode move left right up down                      |
|          | \<F8\>                      | tagbar toggle / vista toggle                            |
|          | \<F5\>                      | undo tree toggle                                        |
|          | tb                          | tabularize                                              |
|          | " @ \<C-r\>                 | peekaboo: show registers                                |
|          | m, m.                       | place next available mark / place with remove first     |
|          | m- m\<SPACE\> m\<BS\>       | delete marks in current line / current buffer / markers |
|          | [\` ]\`                     | jump to prev / next mark                                |
|          | [' ]'                       | jump to prev / next mark's linestart                    |
|          | [- ]-                       | jump to prev / next marker of the same type             |
|          | [= ]=                       | jump to prev / next marker of all type                  |
|          | m/ m?                       | show all mark / markers                                 |
|          | \<CR\> \<LEADER\>s          | quickselect                                             |
|          | \<LEADER\>c\<SPACE\>        | toggle comment                                          |
|          | \<LEADER\>cy                | yank then comment                                       |
|          | \<C-n\> \<C-Up\> \<C-Down\> | visual multi select                                     |
|          | n N [ ]                     | visual multi get/select next/prev                       |
|          | q Q                         | visual multi skip and get next / remove current         |
|          | csxy                        | change surround x to y (left half with space)           |
|          | dsx                         | delete surround x                                       |
|          | yiswx                       | add surround x                                          |
|          | Sx                          | add surround x in visual mode                           |
|          | \<UNUSED\> [c ]c            | gitgutter next/prev hunk                                |
|          | \<UNUSED\> \<LEADER\>gs/p/u | gitgutter stage/preview/undo hunk                       |
|          | \<M-o\>                     | rnvimr toggle                                           |
|          | \<C-t\> \<C-x\> \<C-v\>     | (in rnvimr) tabedit / splitedit /vsplitedit             |
|          | gw yw                       | (in rnvimr) goto nvim cwd / emt rnvimr cwd              |
|          | s ss                        | subversive substitute (line)                            |
|          | \<LEADER\>s ss              | subversive substitute range / word range                |
|          | ga                          | easy align                                              |
|          | \<LEADER\>\<LEADER\>w f[c]  | easymotion: jump to word / find and jump to some char   |
|          | gJ gS                       | split / join statements                                 |
|          | [count]gcc gbc gc gb        | comment.nvim: toggle comment in normal / visual         |
|          | \<C-\\\>                    | toggle terminal                                         |
|          | \<A-hjkl\>                  | move line(s) or block                                   |
|          | \<LEADER\>F f fw fp         | nvim-spectre: find and replace                          |
|          | \<LEADER\>qf rc R           | nvim-spectre: send to quickfix / replace current / all  |
|          | \<LEADER\>tu ti th          | nvim-spectre: toggle live-update / ignore case / hidden |
|          | \<LEADER\>ff fg fb fh       | nvim-telescope: find file/content/buffer/helptag        |
| coc      | \<LEADER\>rn                | rename variable                                         |
|          | \<LEADER\>- = d             | diagnostic prev / next / show all                       |
|          | gd gt gi gr                 | goto def typedef imple reference                        |
|          | gm                          | show man                                                |
|          | \<LEADER\>m                 | format                                                  |
|          | \<LEADER\>a ac              | code action for selected and whole buffer               |
|          | \<LEADER\>o b               | find / show symbols                                     |
|          | \<LEADER\>y                 | yank history                                            |
|          | \<LEADER\>ts                | translate                                               |
|          | \<C-j\> \<C-k\>             | snippet prev / next entry                               |
| text obj | i\| a\|                     | table entry text object                                 |
|          | i% a%                       | pairs                                                   |
|          | \<UNUSED\> ic ac            | gitgutter hunk                                          |
|          | % [% ]% z% i% a%            | matchpairs and text objects                             |
|          | if af                       | function                                                |
|          | ic ac                       | classobj                                                |
| commands | :GenToc[...]                | vim-markdown-toc: generate TOC                          |
|          | :AGit                       | agit.vim: show git log messages                         |
