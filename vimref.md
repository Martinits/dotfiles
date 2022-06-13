## vim-reference

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
|          | /pattern/{num,b,e} ?        | search    p                                             |
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
|          | \<F8\>                      | tagbar toggle                                           |
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
|          | [c ]c                       | gitgutter next/prev hunk                                |
|          | \<LEADER\>gs/p/u            | gitgutter stage/preview/undo hunk                       |
| text obj | i\| a\|                     | table entry text object                                 |
|          | i% a%                       | pairs                                                   |
|          | ic ac                       | gitgutter hunk                                          |
|          | % [% ]% z% i% a%            | matchpairs and text objects                             |


