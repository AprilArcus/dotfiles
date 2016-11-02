" File:       monokai.vim
" Maintainer: Crusoe Xia (crusoexia)
" URL:        https://github.com/crusoexia/vim-monokai
" License:    MIT
"
" The colour palette is from http://www.colourlovers.com/
" The original code is from https://github.com/w0ng/vim-hybrid

" Initialisation
" --------------

if has("gui_running")
  if !exists("g:monokai_gui_italic")
    let g:monokai_gui_italic = 1
  endif
else
  if !exists("g:monokai_term_italic")
    let g:monokai_term_italic = 0
  endif
  if !exists("g:monokai_termcolors")
    if &t_Co < 256
      let g:monokai_termcolors = 16
    else
      let g:monokai_termcolors = 256
    endif
  endif
endif

if ! exists("g:monokai_gui_italic")
    let g:monokai_gui_italic = 1
endif

if ! exists("g:monokai_term_italic")
    let g:monokai_term_italic = 0
endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monokai"

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:monokai_term_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  endif
  if g:monokai_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  if g:monokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------


let s:white       = { "gui": "#E8E8E3", "cterm": "252", "cterm16": "15" }
let s:grey        = { "gui": "#8F908A", "cterm": "243", "cterm16":  "7" }
let s:warmgrey    = { "gui": "#75715E", "cterm":  "59", "cterm16":  "7" }
let s:darkgrey    = { "gui": "#64645e", "cterm": "239", "cterm16":  "8" }
let s:lightgrey   = { "gui": "#575b61", "cterm": "237", "cterm16":  "8" }
let s:lightblack2 = { "gui": "#383a3e", "cterm": "236", "cterm16":  "8" }
let s:lightblack  = { "gui": "#2D2E27", "cterm": "235", "cterm16":  "8" }
let s:black       = { "gui": "#272822", "cterm": "234", "cterm16":  "0" }
let s:darkblack   = { "gui": "#211F1C", "cterm": "233", "cterm16":  "0" }

let s:red         = { "gui": "#000000", "cterm": "0", "cterm16":  "1" }
let s:orange      = { "gui": "#000000", "cterm": "0", "cterm16":  "9" }
let s:gold        = { "gui": "#000000", "cterm": "0", "cterm16":  "3" }
let s:yellow      = { "gui": "#000000", "cterm": "0", "cterm16": "11" }
let s:green       = { "gui": "#000000", "cterm": "0", "cterm16":  "2" }
let s:turquoise   = { "gui": "#000000", "cterm": "0", "cterm16": "10" }
let s:cyan        = { "gui": "#000000", "cterm": "0", "cterm16": "14" }
let s:azure       = { "gui": "#000000", "cterm": "0", "cterm16":  "6" }
let s:blue        = { "gui": "#000000", "cterm": "0", "cterm16":  "4" }
let s:violet      = { "gui": "#000000", "cterm": "0", "cterm16": "12" }
let s:fuchsia     = { "gui": "#000000", "cterm": "0", "cterm16":  "5" }
let s:magenta     = { "gui": "#000000", "cterm": "0", "cterm16": "13" }





" let s:indigo

" let s:blue


















" Highlighting 
" ------------

" editor
call s:h("Normal",        {                             })
"call s:h("ColorColumn",  {                     "bg": s:lightblack   })
call s:h("ColorColumn",   {                     "bg": s:darkblack    })
call s:h("CursorColumn",  {                     "bg": s:lightblack2  })
call s:h("CursorLine",    {                     "bg": s:lightblack2  })
"call s:h("NonText",      { "fg": s:lightgrey                        })
call s:h("NonText",       { "fg": s:black                            })
call s:h("StatusLine",    { "fg": s:black,      "bg": s:warmgrey     })
call s:h("StatusLineNC",  { "fg": s:warmgrey,   "bg": s:darkgrey     })
call s:h("TabLine",       { "fg": s:darkblack,  "bg": s:white        })
call s:h("TabLineFill",   {                     "bg": s:darkgrey     })
"call s:h("TabLineSel",    {})
call s:h("Visual",        {                     "bg": s:lightgrey    })
call s:h("Search",        { "fg": s:black,      "bg": s:yellow       })
call s:h("MatchParen",    { "fg": s:black,      "bg": s:violet       })
call s:h("Question",      { "fg": s:yellow                           })
call s:h("ModeMsg",       { "fg": s:yellow                           })
call s:h("MoreMsg",       { "fg": s:yellow                           })
call s:h("ErrorMsg",      { "fg": s:red                              })
call s:h("WarningMsg",    { "fg": s:red                              })
call s:h("VertSplit",     {                     "bg": s:darkgrey     })
"call s:h("LineNr",       { "fg": s:grey,       "bg": s:lightblack   })
call s:h("LineNr",        { "fg": s:grey,       "bg": s:darkblack    })
"call s:h("CursorLineNr", { "fg": s:orange,     "bg": s:lightblack   })
call s:h("CursorLineNr",  { "fg": s:grey,       "bg": s:lightblack2  })
call s:h("SignColumn",    {                     "bg": s:lightblack   })

" misc
"call s:h("SpecialKey",   { "fg": s:magenta   })
call s:h("SpecialKey",    { "fg": s:black  })
call s:h("Title",         { "fg": s:yellow })
call s:h("Directory",     { "fg": s:cyan   })

" diff
call s:h("DiffAdd",       { "fg": s:white,      "bg": s:turquoise })
call s:h("DiffDelete",    { "fg": s:white,      "bg": s:red })
call s:h("DiffChange",    { "fg": s:white,      "bg": s:gold })
call s:h("DiffText",      { "fg": s:black,      "bg": s:yellow })

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:darkblack })
call s:h("FoldColumn",    {                     "bg": s:darkblack })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:lightblack, "bg": s:white })
call s:h("PmenuSel",      { "fg": s:cyan,       "bg": s:black,        "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:lightblack, "bg": s:grey })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:violet })
call s:h("Number",        { "fg": s:violet })
call s:h("Float",         { "fg": s:violet })
call s:h("Boolean",       { "fg": s:violet })
call s:h("Character",     { "fg": s:yellow })
call s:h("String",        { "fg": s:yellow })

call s:h("Type",          { "fg": s:cyan })
call s:h("Structure",     { "fg": s:cyan })
call s:h("StorageClass",  { "fg": s:cyan })
call s:h("Typedef",       { "fg": s:cyan })
    
call s:h("Identifier",    { "fg": s:green })
call s:h("Function",      { "fg": s:green })
                         
call s:h("Statement",     { "fg": s:magenta })
call s:h("Operator",      { "fg": s:magenta })
call s:h("Label",         { "fg": s:magenta })
call s:h("Keyword",       { "fg": s:cyan })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:magenta })
call s:h("Define",        { "fg": s:magenta })
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:green })
                           
call s:h("Special",       { "fg": s:violet })
call s:h("SpecialChar",   { "fg": s:magenta })
call s:h("Delimiter",     { "fg": s:magenta })
call s:h("SpecialComment",{ "fg": s:cyan })
call s:h("Tag",           { "fg": s:magenta })
"        Debug"

call s:h("Todo",          { "fg": s:orange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:warmgrey, "format": "italic" })
                         
call s:h("Underlined",    { "fg": s:green })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:white, "bg": s:red })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:yellow })
call s:h("NERDTreeClosable",        { "fg": s:yellow })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:magenta })
call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:magenta })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:grey })
call s:h("NERDTreeDir",             { "fg": s:grey })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:orange })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:magenta })

" Vim command
call s:h("vimCommand",              { "fg": s:magenta })

" Javascript
call s:h("jsFuncName",          { "fg": s:green })
call s:h("jsThis",              { "fg": s:magenta })
call s:h("jsFunctionKey",       { "fg": s:green })
call s:h("jsPrototype",         { "fg": s:cyan })
call s:h("jsExceptions",        { "fg": s:cyan })
call s:h("jsFutureKeys",        { "fg": s:cyan })
call s:h("jsBuiltins",          { "fg": s:cyan })
call s:h("jsArgsObj",           { "fg": s:cyan })
call s:h("jsStatic",            { "fg": s:cyan })
call s:h("jsSuper",             { "fg": s:cyan })
call s:h("jsFuncArgRest",       { "fg": s:violet, "format": "italic" })                                 
call s:h("jsFuncArgs",          { "fg": s:orange, "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:cyan })
call s:h("jsDocTags",           { "fg": s:cyan,   "format": "italic" })
                                 
" Html
call s:h("htmlTag",             { "fg": s:white })
call s:h("htmlEndTag",          { "fg": s:white })
call s:h("htmlTagName",         { "fg": s:magenta })
call s:h("htmlArg",             { "fg": s:green })
call s:h("htmlSpecialChar",     { "fg": s:violet })

" Xml
call s:h("xmlTag",              { "fg": s:magenta })
call s:h("xmlEndTag",           { "fg": s:magenta })
call s:h("xmlTagName",          { "fg": s:orange })
call s:h("xmlAttrib",           { "fg": s:green })

" CSS
call s:h("cssProp",             { "fg": s:yellow })
call s:h("cssUIAttr",           { "fg": s:yellow })
call s:h("cssFunctionName",     { "fg": s:cyan })
call s:h("cssColor",            { "fg": s:violet })
call s:h("cssPseudoClassId",    { "fg": s:violet })
call s:h("cssClassName",        { "fg": s:green })
call s:h("cssValueLength",      { "fg": s:violet })
call s:h("cssCommonAttr",       { "fg": s:magenta })
call s:h("cssBraces" ,          { "fg": s:white })
call s:h("cssClassNameDot",     { "fg": s:magenta })
call s:h("cssURL",              { "fg": s:orange, "format": "underline,italic" })

" LESSgreencall s:h("lessVariable",        { "fg": s:green })

" ruby
call s:h("rubyInterpolationDelimiter",  {})
call s:h("rubyInstanceVariable",        {})
call s:h("rubyGlobalVariable",          {})
call s:h("rubyClassVariable",           {})
call s:h("rubyPseudoVariable",          {})
call s:h("rubyFunction",                { "fg": s:green })
call s:h("rubyStringDelimiter",         { "fg": s:yellow })
call s:h("rubyRegexp",                  { "fg": s:yellow })
call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
call s:h("rubySymbol",                  { "fg": s:violet })
call s:h("rubyEscape",                  { "fg": s:violet })
call s:h("rubyInclude",                 { "fg": s:magenta })
call s:h("rubyOperator",                { "fg": s:magenta })
call s:h("rubyControl",                 { "fg": s:magenta })
call s:h("rubyClass",                   { "fg": s:magenta })
call s:h("rubyDefine",                  { "fg": s:magenta })
call s:h("rubyException",               { "fg": s:magenta })
call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
call s:h("rubyRailsARMethod",           { "fg": s:orange })
call s:h("rubyRailsRenderMethod",       { "fg": s:orange })
call s:h("rubyRailsMethod",             { "fg": s:orange })
call s:h("rubyConstant",                { "fg": s:cyan })
call s:h("rubyBlockArgument",           { "fg": s:orange })
call s:h("rubyBlockParameter",          { "fg": s:orange })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:cyan })

" c
call s:h("cLabel",                      { "fg": s:magenta })
call s:h("cStructure",                  { "fg": s:magenta })
call s:h("cStorageClass",               { "fg": s:magenta })
call s:h("cInclude",                    { "fg": s:green })
call s:h("cDefine",                     { "fg": s:green })