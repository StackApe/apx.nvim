" Vim syntax file
" Language: ApX (APEX Command Language)
" Maintainer: APEX PDE
" Latest Revision: Dec 28, 2025
" Version: 0.3.54

if exists("b:current_syntax")
  finish
endif

" Comments - single line (#) and multi-line (### ... ###)
syn match apxComment "#\(##\)\@!.*$" contains=apxTodo
syn region apxCommentBlock start="###" end="###" contains=apxTodo
syn keyword apxTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region apxString start=/"/ skip=/\\"/ end=/"/ contains=apxEscape,apxVariable
syn region apxStringRaw start=/r"/ skip=/\\"/ end=/"/
syn region apxStringSingle start=/'/ skip=/\\'/ end=/'/
syn region apxStringTriple start=/"""/ end=/"""/
syn match apxEscape contained /\\[nrt"\\]/

" Numbers
syn match apxNumber /\<\d\+\>/
syn match apxNumber /\<0x[0-9a-fA-F_]\+\>/
syn match apxNumber /\<0b[01_]\+\>/
syn match apxNumber /\<0o[0-7_]\+\>/
syn match apxFloat /\<\d\+\.\d\+\>/

" Range operator
syn match apxRange /\d\+\.\.\=\d\+/

" Variables
syn match apxVariable /\$[a-zA-Z_][a-zA-Z0-9_]*/
syn match apxEnvVar /\$env\.[a-zA-Z_][a-zA-Z0-9_]*/
syn match apxSpecialVar /\$it\>/
syn match apxSpecialVar /\$_\>/
syn match apxSpecialVar /\$err\>/

" Operators
syn match apxOperator /|/
syn match apxOperator /+\|-\|\*\|\/\|%/
syn match apxOperator /==\|!=\|<=\|>=\|<\|>/
syn match apxOperator /&&\|||/
syn match apxOperator /=/
syn match apxOperator /\.\.\./
syn match apxOperator /??/

" Keywords - Control Flow
syn keyword apxKeyword if else elif for while in return break continue match loop
" Keywords - Definitions
syn keyword apxKeyword macro alias unalias fn const let set
" Keywords - Error Handling
syn keyword apxKeyword try catch
" Keywords - Async
syn keyword apxKeyword spawn await parallel timeout
" Keywords - Modules
syn keyword apxKeyword use from import as source
" Keywords - Testing
syn keyword apxKeyword test
" Keywords - Logical
syn keyword apxKeyword and or not
" Keywords - Events
syn keyword apxKeyword on emit
" Keywords - Object/Enum
syn keyword apxKeyword obj enum

" Boolean and Null
syn keyword apxBoolean true false
syn keyword apxNull null

" ============================================================================
" Built-in Commands (524 total from interpreter.rs)
" ============================================================================

" I/O Commands
syn keyword apxCommand echo print pwd cd cat read input run

" File Operations
syn keyword apxCommand touch cp mv rename rm ls ll mkdir ln symlink chmod chown chgrp
syn keyword apxCommand exists file-info file-size file-type file-test
syn keyword apxCommand write append-file read-bytes write-bytes
syn keyword apxCommand is-file is-dir is-symlink glob walk tree
syn keyword apxCommand basename dirname realpath readlink umask home

" List Operations
syn keyword apxCommand count length len first last take skip get head tail
syn keyword apxCommand reverse append prepend flatten uniq unique sum avg
syn keyword apxCommand min max range enumerate compact zip zip-record
syn keyword apxCommand chunks window pair insert-at remove-at zip-lists
syn keyword apxCommand has

" Pipeline Filters
syn keyword apxCommand where each select sort sort-by group-by
syn keyword apxCommand any all none filter map find reject
syn keyword apxCommand mapfile tee cut

" String Operations
syn keyword apxCommand upper lower trim split join replace lines
syn keyword apxCommand contains starts-with ends-with empty
syn keyword apxCommand chars char-at slice index-of
syn keyword apxCommand pad-left pad-right str-pad-left str-pad-right left right
syn keyword apxCommand repeat capitalize title-case
syn keyword apxCommand str str-distance byte-len bytes bytes-at bytes-slice
syn keyword apxCommand bytes-find bytes-replace bytes-concat brace-expand
syn keyword apxCommand wc tr diff

" Math Commands
syn keyword apxCommand abs round ceil floor pow sqrt
syn keyword apxCommand sin cos tan log exp
syn keyword apxCommand clamp lerp distance angle deg-to-rad rad-to-deg

" Bitwise Operations
syn keyword apxCommand band bor bxor bnot shl shr bshl bshr brol bror

" Colors & Formatting
syn keyword apxCommand red green yellow blue magenta cyan bold dim underline
syn keyword apxCommand italic blink strike normal-mode reverse-video
syn keyword apxCommand bg-black bg-blue bg-cyan bg-green bg-magenta
syn keyword apxCommand bg-red bg-rgb bg-white bg-yellow
syn keyword apxCommand rgb color hex ansi-test

" Data Formats - JSON/YAML/TOML/CSV
syn keyword apxCommand parse-json from-json to-json
syn keyword apxCommand parse-yaml to-yaml
syn keyword apxCommand parse-toml to-toml
syn keyword apxCommand parse-csv to-csv
syn keyword apxCommand from-html to-html to-md
syn keyword apxCommand from-ini parse-ini to-ini
syn keyword apxCommand from-msgpack to-msgpack
syn keyword apxCommand from-ssv from-table to-table
syn keyword apxCommand table table-columns table-rows table-print

" Date/Time
syn keyword apxCommand now now-ms timestamp date parse-date format-date
syn keyword apxCommand date-add date-diff date-parse seq-date
syn keyword apxCommand from-timestamp to-timestamp to-timezone timezones cal
syn keyword apxCommand duration-ms duration-ns duration-secs to-duration elapsed

" Filesize
syn keyword apxCommand filesize-bytes filesize-kb filesize-mb to-filesize

" Git Commands
syn keyword apxCommand git-status git-log git-branch git-diff
syn keyword apxCommand git-add git-commit git-push git-pull

" Crypto & Hashing
syn keyword apxCommand hash-file hash-id
syn keyword apxCommand caesar xor rot13
syn keyword apxCommand aes-encrypt aes-decrypt jwt-decode
syn keyword apxCommand password-gen entropy random-bytes uuid

" Encoding
syn keyword apxCommand hex-encode hex-decode hex-dump
syn keyword apxCommand url-encode url-decode url-parse url-join

" Network Commands
syn keyword apxCommand dns-lookup ptr-lookup whois port-scan
syn keyword apxCommand ip-addr ping netstat ip-route ip-link traceroute arp
syn keyword apxCommand headers recon robots

" HTTP Commands
syn keyword apxCommand http-get http-post http-put http-delete http-patch
syn keyword apxCommand http-head http-options http-request http-serve
syn keyword apxCommand download fetch serve

" WiFi Commands
syn keyword apxCommand wifi-scan wifi-status wifi-connect wifi-disconnect
syn keyword apxCommand wifi-saved wifi-forget

" Bluetooth Commands
syn keyword apxCommand bt-status bt-devices bt-scan bt-connect bt-disconnect
syn keyword apxCommand bt-pair bt-power bt-remove

" Firewall Commands
syn keyword apxCommand firewall-status firewall-rules firewall-allow firewall-deny

" Binary Analysis
syn keyword apxCommand strings binary-info parse-elf parse-pe symbols disassemble
syn keyword apxCommand analyze detect-encoding decode-auto

" WebSocket
syn keyword apxCommand ws-connect ws-echo

" Database - SQLite
syn keyword apxCommand sqlite-create sqlite-exec sqlite-query sqlite-tables sqlite-schema

" Storage Commands
syn keyword apxCommand stor-create stor-insert stor-get stor-delete stor-list stor-clear

" Archive
syn keyword apxCommand zip unzip

" Notifications
syn keyword apxCommand notify notify-urgent notify-progress alert

" Audio
syn keyword apxCommand audio-play audio-beep audio-volume beep

" QR Code
syn keyword apxCommand qr-encode qr-save

" Email
syn keyword apxCommand email-validate email-send

" SSH/SCP
syn keyword apxCommand ssh-exec scp-upload

" PDF
syn keyword apxCommand pdf-create pdf-text

" Markdown
syn keyword apxCommand md-to-html md-parse md-strip

" Screenshots & Display
syn keyword apxCommand monitors screenshot screenshot-region screenshot-window windows
syn keyword apxCommand screen-size

" System Monitoring
syn keyword apxCommand sys-info mem-info cpu-info disk-info processes loadavg uptime
syn keyword apxCommand launch hostname os which env set-env unsetenv
syn keyword apxCommand spawn-process kill-process process-list
syn keyword apxCommand term term-size

" Cursor & Terminal
syn keyword apxCommand cursor-hide cursor-show cursor-move raw-mode

" Canvas/Image (WASM)
syn keyword apxCommand canvas-circle canvas-clear canvas-fill canvas-line
syn keyword apxCommand canvas-rect canvas-resize canvas-size canvas-text
syn keyword apxCommand canvas-image canvas-sprite canvas-save canvas-restore
syn keyword apxCommand canvas-rotate canvas-scale canvas-translate canvas-alpha
syn keyword apxCommand canvas-mouse

" Collision Detection (WASM)
syn keyword apxCommand collide-rect collide-point collide-circle

" Regex Commands
syn keyword apxCommand matches match-regex replace-regex split-regex capture-groups grep

" Type Conversion
syn keyword apxCommand to-int to-float to-string to-bool

" Type Predicates
syn keyword apxCommand is-int is-float is-number is-string is-bool is-list
syn keyword apxCommand is-record is-null is-closure is-path is-tuple is-set
syn keyword apxCommand is-enum is-task is-duration is-filesize is-empty
syn keyword apxCommand is-table is-terminal is-defined

" Set Operations
syn keyword apxCommand set-add set-contains set-diff set-intersect
syn keyword apxCommand set-remove set-to-list set-union

" Tuple Operations
syn keyword apxCommand tuple tuple-get tuple-to-list

" Functional Commands
syn keyword apxCommand transpose

" Utility Commands
syn keyword apxCommand help version type typeof sleep random clear
syn keyword apxCommand aliases assert debug describe inspect
syn keyword apxCommand seq seq-char keys values
syn keyword apxCommand watch confirm choose exec
syn keyword apxCommand validate getopts sudo
syn keyword apxCommand btw fortune bri progress prompt project explore theme

" Clipboard & Browser
syn keyword apxCommand clipboard-read clipboard-write browser-open browser-confirm

" Panel Control (APEX GUI)
syn keyword apxCommand open close toggle focus hsplit vsplit edit panels

" Timer/Async Commands
syn keyword apxCommand after every timeout elapsed timeit timer timer-cancel cancel-timer

" Session/Local Storage (WASM)
syn keyword apxCommand session-get session-set local-get local-set local-remove

" Location/Navigation (WASM)
syn keyword apxCommand location location-hash location-host location-path location-search
syn keyword apxCommand navigate reload history-back history-forward history-search

" DOM Manipulation (WASM)
syn keyword apxCommand dom-get dom-set dom-query dom-create dom-remove
syn keyword apxCommand dom-attr dom-style dom-html dom-class-add dom-class-remove

" Input/Keyboard (WASM)
syn keyword apxCommand input-value input-set input-focus input-checked input-listen
syn keyword apxCommand key-wait key-down key-pressed key-available read-key read-char

" Mouse (WASM)
syn keyword apxCommand mouse-pos mouse-x mouse-y mouse-down

" Scroll (WASM)
syn keyword apxCommand scroll-to scroll-by

" Console (WASM)
syn keyword apxCommand console-log error printf

" AI Commands
syn match apxCommand /ai\.ask/
syn match apxCommand /ai\.explain/
syn match apxCommand /ai\.fix/

" Records and Lists
syn region apxRecord start=/{/ end=/}/ contains=apxString,apxNumber,apxFloat,apxBoolean,apxNull,apxVariable,apxComment
syn region apxList start=/\[/ end=/\]/ contains=apxString,apxNumber,apxFloat,apxBoolean,apxNull,apxVariable,apxComment,apxList

" Flags
syn match apxFlag /--[a-zA-Z][a-zA-Z0-9-]*/
syn match apxFlag /-[a-zA-Z]/

" Prompt (for display in REPL output)
syn match apxPrompt /^;\s*/
syn match apxPrompt /^>>\s*/

" Define highlighting
hi def link apxComment Comment
hi def link apxCommentBlock Comment
hi def link apxTodo Todo
hi def link apxString String
hi def link apxStringRaw String
hi def link apxStringSingle String
hi def link apxStringTriple String
hi def link apxEscape SpecialChar
hi def link apxNumber Number
hi def link apxFloat Float
hi def link apxRange Special
hi def link apxVariable Identifier
hi def link apxEnvVar Identifier
hi def link apxSpecialVar Special
hi def link apxOperator Operator
hi def link apxKeyword Keyword
hi def link apxBoolean Boolean
hi def link apxNull Constant
hi def link apxCommand Function
hi def link apxFlag PreProc
hi def link apxPrompt Special
hi def link apxRecord Structure
hi def link apxList Structure

let b:current_syntax = "apx"
