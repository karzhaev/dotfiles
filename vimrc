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
" Фолдинг по отсупам
set foldenable
set foldlevel=100
set foldmethod=marker
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
set nowrap
" Преобразование Таба в пробелы
"set expandtab
" Размер табуляции по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4

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
"set wildmenu
"Не Показывать пробелы и табы
"set nolist
" Настройка отображения специальных символов
set list
set listchars=tab:→\ ,space:·
" Включение сторонних плагинов
"filetype plugin off
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

"Backspace
set backspace=indent,eol,start
