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
    - kanshi
- .fzf.zsh - fzf config
- .func.zsh - custom shell functions
- .gdbinit - gdb-dashboard

### [n]vim-reference

  | mode       | keybinding                   | action                                                  |
  |------------|------------------------------|---------------------------------------------------------|
  | help       | \<C-]\>                      | jump to link                                            |
  | normal     | ct                           | join two lines                                          |
  |            | gJ                           | join two withoutspace                                   |
  |            | U                            | line undo (act as a change, not undo)                   |
  |            | * #                          | search current word                                     |
  |            | i I a A o O                  | enter insert mode                                       |
  |            | w b e ge                     | word jump                                               |
  |            | W B E gE                     | word jump separated by blanks                           |
  |            | { }                          | paragraph jump                                          |
  |            | << >>                        | remove/add indent                                       |
  |            | <{obj} >{obj}                | indent for object                                       |
  |            | \<C-s\> \<C-e\>              | goto start end of line                                  |
  |            | gj gk                        | move up/down in wrapped line                            |
  |            | f F t T ; ,                  | find reverse-find to reverse-to repeat reverse-repeat   |
  |            | [[ ][ [] ]]                  | jump to function start/end                              |
  |            | [x ]y                        | jump to pair xy                                         |
  |            | \<C-UD\>                     | scroll halfscreen                                       |
  |            | '' \<C-o\> \<C-i\>(\<TAB\>)  | jump backward or forward                                |
  |            | 'x mx                        | mark and jump to mark (capital for global marks)        |
  |            | " q @                        | register (capital for append)                           |
  |            | ~ g~ gu gU g~~ guu gUU       | case change                                             |
  |            | gv                           | repeat visual select                                    |
  |            | gi                           | return to insert place                                  |
  |            | zz zt zb                     | move current line to middle/top/bottom of screen        |
  |            | zc zo zuz                    | fold unfold update-fold                                 |
  |            | zr zm zR zM                  | reduce/more fold, reduce/more all fold                  |
  |            | zn zN zi                     | open/close all fold temporarily, and toggle             |
  | visual     | ~ u U                        | case change                                             |
  |            | \< \>                        | shift block                                             |
  | command    | \<C-HL\> \<C-FB\> \<C-SE\>   | move forward/backward char/word start/end               |
  |            | \<C-JK\>                     | history forward/backward                                |
  |            | \<C-WU\>                     | delete word/till line start                             |
  |            | \<C-D\>                      | show completion list                                    |
  |            | /pattern/{num,b,e} ?         | search p                                                |
  |            | {num},{num}                  | line ranger: can use: % ^ . $ + - ? / '                 |
  |            | {num}:                       | equal to :.,.+{num-1}                                   |
  |            | s/pattern/replace/gc         | search and replace                                      |
  |            | g/pattern/command/gc         | search and run command                                  |
  |            | \< \> \{num}                 | use them in pattern                                     |
  |            | !                            | filter                                                  |
  | insert     | \<C-A\>                      | insert again                                            |
  |            | \<C-R\> x                    | paste register x                                        |
  |            | \<C-O\>                      | temp normal command                                     |
  |            | \<C-D\> \<C-T\>              | remove/add indent                                       |
  | text obj   | \|                           | table entry                                             |
  |            | %                            | pairs                                                   |
  |            | f                            | function                                                |
  |            | c                            | classobj                                                |
  |            | g                            | git hunk                                                |
  |            | s                            | statement                                               |
  |            | l                            | loop                                                    |
  |            | p                            | parameter                                               |
  | treesitter | \<LEADER\>sp sP              | swap next / prev parameter                              |
  |            | [f [c                        | goto prev function / class start                        |
  |            | [F [C                        | goto prev funciton / class end                          |
  |            | ]f ]c                        | goto next function / class start                        |
  |            | ]F ]C                        | goto next function / class end                          |
  | marks      | [\` ]\`                      | jump to prev / next mark                                |
  |            | [' ]'                        | jump to prev / next mark's linestart                    |
  |            | [- ]-                        | jump to prev / next marker of the same type             |
  |            | [= ]=                        | jump to prev / next marker of all type                  |
  |            | m/ m?                        | show all mark / markers                                 |
  |            | m, m.                        | place next available mark / place with remove first     |
  |            | m- m\<SPACE\> m\<BS\>        | delete marks in current line / current buffer / markers |
  | git        | \<LEADER\>hp hn              | git goto prev / next hunk                               |
  |            | \<LEADER\>hs hr hu           | git hunk stage / reset / undo_stage                     |
  |            | \<LEADER\>hS hR              | git buffer stage / reset                                |
  |            | \<LEADER\>hv hb hB           | git hunk preview / toggle_blame / blame                 |
  |            | \<LEADER\>hd hD              | git buffer diff to index / diff to HEAD                 |
  |            | \<LEADER\>ht                 | git toggle show_deleted                                 |
  | lsp        | \<LEADER\>rn                 | rename variable                                         |
  |            | \<LEADER\>dd                 | show diagnostic loclist                                 |
  |            | \<LEADER\>- =                | diagnostic prev / next                                  |
  |            | \<LEADER\>[ ]                | diagnostic prev / next only error                       |
  |            | gd gD gt gp gr               | goto def dec typedef imple reference                    |
  |            | gH                           | hover info                                              |
  |            | \<LEADER\>mt                 | format                                                  |
  |            | \<LEADER\>ca                 | code action                                             |
  |            | \<LEADER\>o                  | outline                                                 |
  |            | \<LEADER\>dp dk              | peek definition / with lspsaga                          |
  |            | \<LEADER\>lf                 | lsp symbol finder                                       |
  |            | \<LEADER\>dl dc db           | show line / cursor / buffer diagnostic                  |
  |            | \<LEADER\>ci co              | call hierachy: incoming / outcoming                     |
  |            | \<M-x\>                      | lsp_signature: toggle                                   |
  |            | \<M-j\>                      | lsp_signature: select next signature                    |
  | cmp        | \<TAB\> \<S-TAB\> \<CR\>     | choose item and confirm                                 |
  |            | \<C-J\> \<C-K\>              | cycle through items                                     |
  |            | \<C-F\> \<F-B\>              | scroll doc                                              |
  |            | \<C-SPACE\>                  | complete completion                                     |
  |            | \<C-E\>                      | abort                                                   |
  | bufferline | \<LEADER\>bg bc bp           | buffer pick / pickclose / togglepin                     |
  | todo       | \<LEADER\>tn tp              | goto next / prev todo                                   |
  |            | \<LEADER\>ts                 | search todo with telescope                              |
  | surround   | csxy                         | change surround x to y (left half with space)           |
  |            | dsx                          | delete surround x                                       |
  |            | ysiwx                        | add surround x                                          |
  |            | Sx                           | add surround x in visual mode                           |
  | substitute | s ss S                       | substitute                                              |
  |            | \<LEADER\>s ss               | substitute range                                        |
  | comment    | [count]gcc gbc gc gb         | comment.nvim: toggle comment in normal / visual         |
  | terminal   | \<C-\\\>                     | toggle terminal                                         |
  | move.nvim  | \<A-hjkl\>                   | move line(s) or block                                   |
  | autopairs  | \<M-e\>                      | autopairs: fast wrap                                    |
  | nvim-tree  | tt tf                        | nvim-tree: toggle / focus                               |
  | neoclip    | \<LEADER\>y                  | yank history with telescope                             |
  | telescope  | \<LEADER\>ff fg fb fh        | nvim-telescope: find file/content/buffer/helptag        |
  | whichkey   | z=                           | whichkey: show spell suggestions                        |
  |            | :WhichKey                    | show all keymaps                                        |
  | treesj     | gJ gS gT                     | join / split / toggle                                   |
  | hop        | \<LEADER\>hw hh              | hop word / anywhere                                     |
  | matchup    | % [% ]% z%                   | matchpairs and text objects                             |
  | plugins    | \<LEADER\>tm                 | table mode toggle                                       |
  |            | \<LEADER\>tt                 | table mode format selected lines                        |
  |            | \<LEADER\>tdd tdc            | table mode delete row or line                           |
  |            | \<LEADER\>tic tiC            | table mode insert column after or before                |
  |            | [\| ]\| {\| }\|              | table mode move left right up down                      |
  |            | \<F5\>                       | undo tree toggle                                        |
  |            | tb                           | tabularize                                              |
  |            | \<C-n\> \<C-Up\> \<C-Down\>  | visual multi select                                     |
  |            | n N [ ]                      | visual multi get/select next/prev                       |
  |            | q Q                          | visual multi skip and get next / remove current         |
  |            | \<M-o\>                      | rnvimr toggle                                           |
  |            | \<C-t\> \<C-x\> \<C-v\>      | (in rnvimr) tabedit / splitedit /vsplitedit             |
  |            | gw yw                        | (in rnvimr) goto nvim cwd / emt rnvimr cwd              |
  |            | ga                           | easy align                                              |
  |            | \<LEADER\>F f fw fp          | nvim-spectre: find and replace                          |
  |            | \<LEADER\>qf rc R            | nvim-spectre: send to quickfix / replace current / all  |
  |            | \<LEADER\>tu ti th           | nvim-spectre: toggle live-update / ignore case / hidden |
  | commands   | :SaveSession :RestoreSession | autosession                                             |
  |            | :PeekOpen :PeekClose         | peek: markdown preview                                  |
  |            | :Glow :Glow!                 | glow: markdown preview                                  |
