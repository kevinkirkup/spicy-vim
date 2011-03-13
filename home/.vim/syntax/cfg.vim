" Filename:     cfg.vim
" Purpose:      Vim syntax file
" Language:     SDE Config file - Unix Shell
" Maintainer:   Kevin S Kirkup kevin.kirkup@sonyericsson.com
" URL:
" Last update:  Sun Mar 20 10:05:08 EST 2005
"
"

" Remove any old syntax stuff hanging around

syn clear
if !exists("sde_cfg_minlines")
	let sde_cfg_minlines = 100
endif
if !exists("sde_cfg_maxlines")
	let sde_cfg_maxlines = 2 * sde_cfg_minlines
endif

if exists("loaded_matchit")
    let b:match_words =
      \ '^\s*\!\s*if\>:'.
      \   '^\s*\!\s*elseif\>:'.
      \   '^\s*\!\s*else\>:'.
      \   '^\s*\!\s*endif\>'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment out this to get less colour
""""""""""""""""""""""""""""""""""""""""""""""""""
let hi_color=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the exclation as a possible keyword character
""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal iskeyword+=!

""""""""""""""""""""""""""""""""""""""""""""""""""
" sde_cfg syntax is case sensitive
""""""""""""""""""""""""""""""""""""""""""""""""""
syn case match

set include=!include

set define=![a-z]\>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Set some common abbreviations for sde config
" files
""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations for the !set command
iabbrev !s            !set
iabbrev !se           !set
iabbrev !un           !unset
iabbrev !uns          !unset
iabbrev !unse         !unset
""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations for the !if command
iabbrev !i             !if
iabbrev !ifd           !ifdef
iabbrev !ifde          !ifdef
iabbrev !ifu           !ifundef
iabbrev !ifun          !ifundef
iabbrev !ifund         !ifundef
iabbrev !ifunde        !ifundef
iabbrev !ifn           !ifndef
iabbrev !ifnd          !ifndef
iabbrev !ifnde         !ifndef
""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations for the !else command
iabbrev !el            !else
iabbrev !els           !else
iabbrev !elsei         !elseif
""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations for the !options command
iabbrev !op            !options
iabbrev !opt           !options
iabbrev !opti          !options
iabbrev !optio         !options
iabbrev !option        !options
""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations for the !include command
iabbrev !in            !include
iabbrev !inc           !include
iabbrev !incl          !include
iabbrev !inclu         !include
iabbrev !includ        !include
""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations for the !IsDefined command
iabbrev IsD            IsDefined()<Left><C-R>=Eatchar('\s')<CR>
iabbrev IsDe           IsDefined()<Left><C-R>=Eatchar('\s')<CR>
iabbrev IsDef          IsDefined()<Left><C-R>=Eatchar('\s')<CR>
iabbrev IsDefi         IsDefined()<Left><C-R>=Eatchar('\s')<CR>
iabbrev IsDefin        IsDefined()<Left><C-R>=Eatchar('\s')<CR>
iabbrev IsDefine       IsDefined()<Left><C-R>=Eatchar('\s')<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations for the !FindSubString command
iabbrev FindS          FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev FindSu         FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev FindSub        FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev FindSubS       FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev FindSubSt      FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev FindSubStr     FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev FindSubStri    FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev FindSubStrin   FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev FindSubString  FindSubString(,)<Left><Left><C-R>=Eatchar('\s')<CR>



" Todo comments in a config file
""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword     sde_cfgTodo                contained TODO
syn match       sde_cfgComment             "#.*$" contains=sde_cfgTodo
syn match       sde_cfgComment             "//-!.*$" contains=sde_cfgTodo

" Compiler option modifiers
""""""""""""""""""""""""""""""""""""""""""""""""""
syn match     sde_cfgCompileOptions      "[+|-| ]\+\(ARM\|ALL\|WIN32\)"
syn match     sde_cfgModifiers           "\(\(IAR\|GCC\|RVDS\)-ARM[A-Z0-9_]*\)\|Win32-Debug\|Win32"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Define the default keywords
""""""""""""""""""""""""""""""""""""""""""""""""""
"syn match   sde_FlagName      /[A-Za-z0-9_-]\+/ contained
syn match   sde_FlagName      /\S\+\>/ contained
syn region  sde_Globals       start="%" end="%" oneline
syn region  sde_Flags         matchgroup=sde_cfgCommand start="\!\(options\|set\|unset\|include\|declare\)\(\s\+-[fli]\)\{,3}" end="$" oneline skipwhite contains=sde_FlagName,sde_Globals
syn region  sde_Flags         matchgroup=sde_cfgCommand start="\!\(options\|set\|unset\|include\)\(\s\+-[fli]\)\{,3}" end="=" oneline skipwhite contains=sde_FlagName,sde_Globals
syn region  sde_Macro         matchgroup=sde_Paren start="[!]\?\(IsDefined\|FindSubString\)(" end=")" contains=ALLBUT,sde_cfgSectionHeader
syn match   sde_cfgExternalCommand  "@[^ ]*"
syn match   sde_cfgIdentifier "\(PHONE_RefApps\|PHONE\|TARGET_NAME\|TARGET\|EMP_SDK_VARIANT\|VARIANT\)"
syn keyword sde_cfgBoolean    On Off


""""""""""""""""""""""""""""""""""""""""""""""""""
" Add the file list sections
""""""""""""""""""""""""""""""""""""""""""""""""""
syn region  sde_cfgSectionHeader      start="\[[+-]\?" end="\(_Options\)\?\]" contains=sde_cfgSectionNames
syn cluster sde_cfgSectionNames       contains=sde_cfgFileListSections,sde_cfgVariantSections,sde_cfgOtherSections,sde_cfgPackageingSections
syn match   sde_cfgFileListSections   "\(IncludeFiles\|InterfaceFiles\|SourceFiles\|Datafiles\|DataFiles\|LinkFiles\|ArchiveFiles\|BuildFiles\|BuildDirectories\|DocumentFiles\|DependantFiles\)" contained
syn match   sde_cfgVariantSections    "\(Variants\|RelatedVariants\|VariantSets\|Targets\|Modules\)" contained
syn match   sde_cfgOtherSections      "\(Doxygen\|Metadata\|AdditionalLink\|ToolCommands\|OfficialBuild\|Name\|SystemName\|MakeIncludeFiles\|MakeRules\|MakeActions\|MakeDefines\|PreBuild\|PostBuild\)" contained
syn match   sde_cfgPackageingSections "\(Packaging_ForbiddenFiles\)" contained
syn region  sde_cfgBetweenSections    start="\[" skip="#.*$" end="\n\?\[" skipwhite skipnl skipempty transparent fold

""""""""""""""""""""""""""""""""""""""""""""""""""
" Default regions for SDE
""""""""""""""""""""""""""""""""""""""""""""""""""
syn region      sde_IfStatement      transparent fold matchgroup=sde_Switch start=/\!\(if\|ifdef\|ifundef\|ifndef\)\>/ end=/\!\(endif\)\>/ skip=/#.*$/
syn match       sde_Else             "\!\(elseif\|else\)\>"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight the module names and the VOB names in
" the list file to make it easier to read.
""""""""""""""""""""""""""""""""""""""""""""""""""
syn match   sde_VobName               "\(\(LD\|TO\|RTP\|CNBJ\|BAS\|GR\|NB\|NS\|MU\)[A-Z_]\+\(SwModule[s]\?\|Products\|FuncBlocks\|FuncUnits\|SubSystems\|UMTS_Ver\)_\(AppLib\|UI\|[0-9]\{3}\|[A-Z]\{,3}\)\)"
syn match   sde_VobName               "LDS_Tools"
syn match   sde_SourceModuleName     "cnh[0-9]\{7}_[a-zA-Z0-9_]\+"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Link the highlight colors to the group
""""""""""""""""""""""""""""""""""""""""""""""""""
syn match   sde_cfgVariable           "\$([^)]*)"
syn match   sde_cfgString             +".*"+
syn match   sde_cfgNumber             "[0-9]\+"
syn match   sde_cfgNumber             "0x[A-Fa-f0-9]\+"
syn match   sde_cfgOperators          "\(!=\|==\|&&\|||\)"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Link the highlight colors to the group
""""""""""""""""""""""""""""""""""""""""""""""""""
hi link sde_cfgCommand            PreCondit
hi link sde_cfgExternalCommand    sde_cfgCommand
hi link sde_cfgModifiers          Operator
hi link sde_cfgCompileOptions     Operator
hi link sde_cfgOperators          Operator
hi link sde_cfgIdentifier         Identifier
hi link sde_FlagName              sde_cfgIdentifier
hi link sde_Paren                 Macro
hi link sde_VobName               Underlined
hi link sde_cfgString             String
hi link sde_cfgNumber             Number
hi link sde_cfgBoolean            Boolean

""""""""""""""""""""""""""""""""""""""""""""""""""
" Link the highlight colors for the SDE switch
" structures
""""""""""""""""""""""""""""""""""""""""""""""""""
hi link sde_SwitchError           Error
hi link sde_SwitchIf              PreCondit
hi link sde_SwitchElse            PreCondit
hi link sde_Switch                PreCondit
hi link sde_IfStatement           PreCondit
hi link sde_Else                  PreCondit
hi link sde_SourceModuleName      Identifier
hi link cfgEndifError             Error

" SDE Comments
""""""""""""""""""""""""""""""""""""""""""""""""""
hi link sde_cfgComment           Comment

" SDE Sections
""""""""""""""""""""""""""""""""""""""""""""""""""
hi link sde_cfgSectionHeader      Function
hi link sde_cfgSectionNames       Function
hi link sde_cfgVariable           Type
hi link sde_Globals               sde_cfgVariable
let b:current_syntax = "sde_cfg"

" String and Character constants
"===============================
"syn match   sde_cfgNumber       "-\=\<\d\+\>"
"syn match   sde_cfgSpecial      contained "\\\d\d\d\|\\[abcfnrtv]"
"syn region  sde_cfgSinglequote matchgroup=sde_cfgOperator start=+'+ end=+'+ 
"syn region  sde_cfgDoubleQuote      matchgroup=sde_cfgOperator start=+"+ skip=+\\"+ end=+"+ contains=sde_cfgDeref,sde_cfgCommandSub,sde_cfgSpecialShellVar,sde_cfgSpecial
"syn match   sde_cfgSpecial  "\\[\\\"\'`$]"

"Error Codes
"syn match   sde_cfgDoError "\<done\>"
"syn match   sde_cfgIfError "\<fi\>"
"syn match   sde_cfgInError "\<in\>"
"syn match   sde_cfgCaseError ";;"
"syn match   sde_cfgEsacError "\<esac\>"
"syn match   sde_cfgCurlyError "}"
"syn match   sde_cfgParenError ")"
"if exists("is_kornshell")
"syn match     sde_cfgDTestError "]]"
"endif
"syn match     sde_cfgTestError "]"
"
"" Tests
""======
"syn region  sde_cfgNone transparent matchgroup=sde_cfgOperator start="\[" skip=+\\\\\|\\$+ end="\]" contains=ALLBUT,sde_cfgFunction,sde_cfgTestError,sde_cfgIdentifier,sde_cfgCase,sde_cfgDTestError,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn region  sde_cfgNone transparent matchgroup=sde_cfgStatement start="\<test\>" skip=+\\\\\|\\$+ matchgroup=NONE end="[;&|]"me=e-1 end="$" contains=ALLBUT,sde_cfgFunction,sde_cfgIdentifier,sde_cfgCase,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn match   sde_cfgTestOpr contained "[!=]\|-.\>\|-\(nt\|ot\|ef\|eq\|ne\|lt\|le\|gt\|ge\)\>"
"
"" DO/IF/FOR/CASE : Repitition operaters
"" ======================================
"syn region  sde_cfgIf transparent matchgroup=sde_cfgBlock start="\<if\>" end="\<fi\>" contains=ALLBUT,sde_cfgFunction,sde_cfgIfError,sde_cfgCase,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn region  sde_cfgFor  matchgroup=sde_cfgStatement start="\<for\>" end="\<in\>" contains=ALLBUT,sde_cfgFunction,sde_cfgInError,sde_cfgCase,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn region sde_cfgCaseEsac transparent matchgroup=sde_cfgBlock start="\<case\>" matchgroup=NONE end="\<in\>"me=s-1 contains=ALLBUT,sde_cfgFunction,sde_cfgCaseError nextgroup=sde_cfgCaseEsac,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn region sde_cfgCaseEsac matchgroup=sde_cfgBlock start="\<in\>" end="\<esac\>" contains=ALLBUT,sde_cfgFunction,sde_cfgCaseError,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn region sde_cfgCase matchgroup=sde_cfgBlock contained start=")"  end=";;" contains=ALLBUT,sde_cfgFunction,sde_cfgCaseError,sde_cfgCase,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn region  sde_cfgNone transparent matchgroup=sde_cfgOperator start="{" end="}" contains=ALLBUT,sde_cfgCurlyError,sde_cfgCase,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn region  sde_cfgSubSh transparent matchgroup=sde_cfgOperator start="(" end=")" contains=ALLBUT,sde_cfgParenError,sde_cfgCase,sde_cfgDerefOperator,@sde_cfgSedStuff
"
"" Misc
""=====
"syn match   sde_cfgOperator                "[!&;|=]"
"syn match   sde_cfgWrapLineOperator        "\\$"
"syn region  sde_cfgCommandSub   matchGroup=sde_cfgSpecial start="`" skip="\\`" end="`" contains=ALLBUT,sde_cfgFunction,sde_cfgCommandSub,sde_cfgTestOpr,sde_cfgCase,sde_cfgEcho,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn region  sde_cfgCommandSub matchgroup=sde_cfgOperator start="$(" end=")" contains=ALLBUT,sde_cfgFunction,sde_cfgCommandSub,sde_cfgTestOpr,sde_cfgCase,sde_cfgEcho,sde_cfgDerefOperator,@sde_cfgSedStuff
"syn match   sde_cfgSource  "^\.\s"
"syn match   sde_cfgSource  "\s\.\s"
"syn region  sde_cfgColon   start="^\s*:" end="$\|" end="#"me=e-1 contains=ALLBUT,sde_cfgFunction,sde_cfgTestOpr,sde_cfgCase,sde_cfgDerefOperator,@sde_cfgSedStuff
"
"" Identifiers
""============
"syn match  sde_cfgIdentifier "\<[a-zA-Z_][a-zA-Z0-9_]*\>="me=e-1
"syn region sde_cfgIdentifier matchgroup=sde_cfgStatement start="\<\(declare\|typeset\|local\|export\|set\|unset\)\>[^/]"me=e-1 matchgroup=sde_cfgOperator skip="\\$" end="$\|[;&]" matchgroup=NONE end="#\|="me=e-1 contains=sde_cfgTestError,sde_cfgCurlyError,sde_cfgWrapLineOperator,sde_cfgDeref
"
"" CHanged this
"syn region sde_cfgDeref         start="\${" end="}" contains=sde_cfgDerefOperator,sde_cfgSpecialVariables
"syn match  sde_cfgDeref         "\$\<[a-zA-Z_][a-zA-Z0-9_]*\>" contains=sde_cfgSpecialVariables
"
"" A bunch of useful sde_cfg keywords
"syn keyword sde_cfgStatement    !options !include !set !unset 
"syn keyword sde_cfgAdminStatement killproc daemon start stop restart reload status killall nice
"syn keyword sde_cfgConditional  !if !else !elseif !endif !ifdef !ifndef
"syn keyword sde_cfgRepeat       select until
"syn keyword sde_cfgFunction     function
"
"" Syncs
"" =====
"if !exists("sde_cfg_minlines")
"  let sde_cfg_minlines = 100
"endif
"exec "syn sync minlines=" . sde_cfg_minlines
"syn sync match sde_cfgIfSync       grouphere  sde_cfgIf       "\<if\>"
"syn sync match sde_cfgIfSync       groupthere sde_cfgIf       "\<fi\>"
"syn sync match sde_cfgForSync      grouphere  sde_cfgFor      "\<for\>"
"syn sync match sde_cfgForSync      groupthere sde_cfgFor      "\<in\>"
"syn sync match sde_cfgCaseEsacSync grouphere  sde_cfgCaseEsac "\<case\>"
"syn sync match sde_cfgCaseEsacSync groupthere sde_cfgCaseEsac "\<esac\>"
"
"syn match sde_cfgDerefOperator contained  +##\=\|%%\=+
"
"
"
"" command line options
"
"" special variables
"if exists("is_sde_cfg")
"syn keyword sde_cfgSpecialVariables contained PPID PWD OLDPWD REPLY UID EUID GROUPS BASH BASH_VERSION BASH_VERSINFO SHLVL RANDOM SECONDS LINENO HISTCMD DIRSTACK PIPESTATUS OPTARG OPTIND HOSTNAME HOSTTYPE OSTYPE MACHTYPE SHELLOPTS IFS PATH HOME CDPATH BASH_ENV MAIL MAILCHECK PS1 PS2 PS3 PS4 TIMEFORMAT HISTSIZE HISTFILE HISTFILESIZE LANG LC_ALL LC_COLLATE LC_MESSAGES PROMPT_COMMAND IGNOREEOF TIMEOUT FCEDIT FIGNORE GLOBIGNORE INPUTRC HISTCONTROL histchars HOSTFILE auto_resume HISTIGNORE OPTERR MAILPATH 
"endif
"syn match  sde_cfgSpecialShellVariables "\$[-#@*$?!0-9]"
"
"" The default methods for highlighting.  Can be overridden later
"
"
"if !exists("did_sde_cfg_syntax_inits")
"  let did_sde_cfg_syntax_inits = 1
"  hi link sde_cfgAdminStatement    Function
"  hi link sde_cfgBlock             Function
"  hi link sde_cfgCaseError         Error
"  hi link sde_cfgColon             sde_cfgStatement
"  hi link sde_cfgCommandOpts       Operator
"  hi link sde_cfgComment           Comment
"  hi link sde_cfgConditional       Conditional
"  hi link sde_cfgCurlyError        Error
"  hi link sde_cfgDeref             sde_cfgShellVariables
"  hi link sde_cfgDerefOperator     sde_cfgOperator
"  hi link sde_cfgDoError           Error
"  hi link sde_cfgDoubleQuote       sde_cfgString
"  hi link sde_cfgEcho              sde_cfgString
"  hi link sde_cfgEmbeddedEcho      sde_cfgString
"  hi link sde_cfgEsacError         Error
"  hi link sde_cfgFunction          Function
"  hi link sde_cfgFunctionName      Function
"  hi link sde_cfgHereDoc           sde_cfgString
"  hi link sde_cfgIdentifier        Identifier
"  hi link sde_cfgIfError           Error
"  hi link sde_cfgInError           Error
"  hi link sde_cfgNumber            Number
"  hi link sde_cfgOperator          Operator
"  hi link sde_cfgParenError        Error
"  hi link sde_cfgRedir             sde_cfgOperator
"  hi link sde_cfgRepeat            Repeat
"  hi link sde_cfgShellVariables    PreProc
"  hi link sde_cfgSinglequote       sde_cfgString
"  hi link sde_cfgSource            sde_cfgOperator
"  hi link sde_cfgSpecial           Special
"  hi link sde_cfgSpecial           Special
"  hi link sde_cfgSpecialShellVar   sde_cfgSpecialVariables
"  hi link sde_cfgSpecialVariables  sde_cfgSpecialVars
"  hi link sde_cfgSpecialVars       Identifier
"  hi link sde_cfgStatement         Statement
"  hi link sde_cfgString            String
"  hi link sde_cfgTestError         Error
"  hi link sde_cfgTestOpr           sde_cfgConditional
"  hi link sde_cfgTodo              Todo
"  hi link sde_cfgVariables         PreProc
"  hi link sde_cfgWrapLineOperator  sde_cfgOperator
"endif
"
"" vim: ts=8
