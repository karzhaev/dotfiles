colorscheme industry
"Поддержка русского языка
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"переключение по F2
imap <F2> 
nnoremap Q @@


"setlocal spell spelllang=ru_ru,en_us

"конец файла в unix формате
set ff=unix

"Показывать номера строк
set number


" Включить подсветку синтаксиса
syntax on
" Поиск в процессе набора
set incsearch
" Подсвечивание результатов поиска
set hlsearch
" умная зависимость от регистра. Детали `:h smartcase`
"set ignorecase
"set smartcase
" Кодировка текста по умолчанию utf8
set termencoding=utf8
" Включаем несовместимость настроек с Vi, так как Vi нам и не понадобится
set nocompatible
" Показывать положение курсора всё время.
set ruler
" Показывать незавершённые команды в статусбаре
"set showcmd
" Выключаем звуковое оповещение о достижении конца буффера, невозможности действия и т.д.
"set noerrorbells visualbell t_vb=
"autocmd GUIEnter * set visualbell t_vb=
" Поддержка мыши
set mouse=a
set mousemodel=popup

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Скрыть панель в gui версии
"set guioptions-=T
" Сделать строку команд высотой в одну строку
"set ch=1
" Скрывать указатель мыши, когда печатаем
"set mousehide
" Включить автоотступы
set autoindent
" Не переносить строки
"set nowrap
" Преобразование Таба в пробелы
" Размер табуляции по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set textwidth=80

"Формат строки состояния. Альтернативные варианты настройки `:h statusline`
"set statusline=%&lt;%f%h%m%r\ %b\ %{&amp;encoding}\ 0x\ \ %l,%c%V\ %P
"set laststatus=2
" Включаем "умные" отступы, например, авто отступ после `{`
"set smartindent
"Отображение парных символов
"set showmatch
"Указание размеров окна редактора по умолчанию
"set lines=50
"set columns=140
" Подсвечивать линию текста, на которой находится курсор
set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray
"highlight CursorLine term=none cterm=none
" Увеличение размера истории
"set history=200
" Дополнительная информация в строке состояния
set wildmenu
"Не Показывать пробелы и табы
"set nolist
" Настройка отображения специальных символов
set list
set listchars=tab:→\ ,space:·
" Включение сторонних плагинов
filetype on
filetype plugin on
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

"Backspace
set backspace=indent,eol,start

"сборка по <F9>
noremap <silent> <F9> :w<cr> :make! all<cr>
"пересборка по <Shift>+<F9>
noremap <silent> <S-F9> :w<cr> :make! clean all<cr>

augroup plantuml
	autocmd!
	autocmd Bufread *.puml :syntax on!
	autocmd Bufread *.puml :set syntax=plantuml
	autocmd Bufread *.puml :set makeprg=plantuml\ -tpng\ %
augroup END

augroup maxima
	autocmd!
	autocmd Bufread *.mac :syntax on!
	autocmd Bufread *.mac :set syntax=maxima
	autocmd Bufread *.mac :set makeprg=maxima\ -b\ %
augroup END

augroup python
	autocmd!
	autocmd FileType python :set expandtab!
	autocmd FileType python :set wrap!
	autocmd FileType python :set tabstop=4
	autocmd FileType python :set makeprg=./%
augroup END

augroup xml
	autocmd!
	autocmd FileType xml let g:xml_syntax_folding=1
	autocmd FileType xml setlocal foldmethod=syntax
	autocmd FileType xml :syntax on
	autocmd FileType xml :%foldopen!
augroup END

augroup fcont-reg
	autocmd!
	autocmd BufRead */fcont-reg/* set makeprg=make\ -C\ ~/develop/fsoft/fcont-reg/arm/o-le
augroup END

augroup fcont-nav-c
	autocmd!
	autocmd BufRead */fcont-nav-c/* set makeprg=make\ -C\ ~/develop/fsoft/fcont-nav-c/arm/o-le
augroup END

