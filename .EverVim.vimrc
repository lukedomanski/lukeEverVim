" Modeline and Notes {
"   EverVim is a modern & powerful vim distribution
"   Repo URL: https://github.com/LER0ever/EverVim
"   Made by [LER0ever](https://github.com/LER0ever)
"   Licensed under
"       * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE.md) or http://www.apache.org/licenses/LICENSE-2.0)
" }


" General env {
    let g:solarized_termtrans=0
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    set listchars=tab:>\ ,trail:.,extends:#,nbsp:.
" }

"Function to underline a line {

    "from http://vim.wikia.com/wiki/Underline_using_dashes_automatically
    function! s:Underline(chars)
      let chars = empty(a:chars) ? '-' : a:chars
      let nr_columns = virtcol('$') - 1
      let uline = repeat(chars, (nr_columns / len(chars)) + 1)
      put =strpart(uline, 0, nr_columns)
      call cursor(line('.'), col('$'))
    endfunction
    command! -nargs=? Underline call s:Underline(<q-args>)

    function! s:Overline(chars)
      let chars = empty(a:chars) ? '-' : a:chars
      let nr_columns = virtcol('$') - 1
      let uline = repeat(chars, (nr_columns / len(chars)) + 1)
      put =strpart(uline, 0, nr_columns)
      call cursor(line('.'), col('$'))
    endfunction
    command! -nargs=? Overline call s:Overline(<q-args>)

    function! s:OverUnderline(chars)
      call s:Overline(a:chars)
      call cursor(line('.') + 1, col('.'))
      call s:Underline(a:chars)
    endfunction
    command! -nargs=? OverUnderline call s:OverUnderline(<q-args>)
" }


" User key binding {

    "list buffers from normal/vis & insert mode
    noremap <C-b>l <ESC>:buffers<CR>
    inoremap <C-b>l <ESC>:buffers<CR>
    "list & change buffers from normal/vis & insert mode
    noremap <C-b>c <ESC>:buffers<CR>:buffer<Space>
    inoremap <C-b>c <ESC>:buffers<CR>:buffer<Space>
    "change to last buffer from normal/vis & insert mode
    noremap <C-b>b <ESC>:b#<CR>
    inoremap <C-b>b <ESC>:b#<CR>
    "underline the current line"
    noremap <Leader>h <ESC>:Underline<Space>
    noremap <Leader>hh <ESC>:OverUnderline<Space>

" }



" User key bindings for plugins/bundles {

" YankRing
"nnoremap <silent> <Leader>yr :YRGetElem<CR>
" CtrlP
"let g:ctrlp_map = '<m-p>'

" }

" Settings for plugins/bundles {

    " Limit version control diff check only to those I use
    let g:signify_vcs_list = [ 'svn', 'git', 'hg' ]

    " Stop bufferline echoing to command window, which requires me to hit enter to
    " dismiss
    let g:bufferline_echo = 0

    let g:neocomplcache_enable_insert_char_pre = 1
    let g:tagbar_autofocus = 1
    let g:tagbar_expand = 1
    let g:indexer_ctagsCommandLineOptions = "--c++-kinds=+p+l --fields=+iaS --extra=+q --languages=c++,c,python,java"
    let g:CSApprox_loaded = 1
    if version < 703
        let g:loaded_numbers = 1
    else
        nnoremap <F3> :NumbersToggle<CR>
    endif
    let g:indent_guides_start_level = 1
    let g:NERDSpaceDelims = 1
    let g:proj_flags="imstg"

    " Reduce clutter on airline
    "   Remove hunk display this info comes from signify
    "   Reduce length of syntastic and whitespace error section
    "   Stop bufferline from printing to file display section
    let g:airline_powerline_fonts=0
    let g:airline#extensions#hunks#enabled = 0
    "let g:syntastic_stl_format = '%E{Err:%fe#%e}%B{, }%W{Warn:%fw#%w}'
    let g:airline#extensions#whitespace#trailing_format = 't:%s'
    let g:airline#extensions#whitespace#mixed_indent_format = 'i:%s'
    let g:airline#extensions#bufferline#enabled = 0

"}
"
" EverVim options {

    " Disable folding
    let g:evervim_disable_folding=1

    " EverVim Bundle Groups
    " Bundle Group name is just folders under ~/.EverVim/plugins
    " Below is the default config, uncomment and make your own
    " let g:evervim_bundle_groups=['general', 'appearance', 'writing', 'youcompleteme', 'programming', 'python', 'javascript', 'typescript', 'html', 'css', 'misc', 'go', 'rust', 'cpp', 'lua']
    let g:evervim_bundle_groups=['general', 'appearance', 'writing', 'youcompleteme', 'programming', 'python', 'java', 'javascript', 'typescript', 'html', 'css', 'misc', 'go', 'rust', 'cpp', 'lua']

    " Color Theme
    " Use :Colors for a list of available colorschemes
    "   let g:evervim_color_theme="dracula"
    "   let g:evervim_airline_theme="dracula"
    "   let g:evervim_light_background = 1
    let g:evervim_color_theme="solarized"
    let g:evervim_airline_theme="solarized"

    " Customize Patched Font
    " Pick one at https://github.com/ryanoasis/nerd-fonts
    " By default it's "Knack Nerd Font" on Unix and "Knack NF" on Windows
    "   let g:evervim_font="Knack Nerd Font"
    let g:evervim_font_size="14"

    " Disable Patched Font
    "   let g:evervim_no_patched_fonts = 1

    " Override Bundle Configuration
    " You can add additional plugins, or disable a set of plugins instead of
    " adding/removing a whole bundle
    " Simply uncomment the following line and add remove plugins in the
    " ~/.EverVim.bundles file using `Plug` and `UnPlug` commands
    let g:override_evervim_bundles = 1
    "
    " in ~/.EverVim.bundles,
    "   Plug 'Someone/AwesomePlugin'
    "   UnPlug 'Someone/PluginToDisable'

    " Automatically changing to open file directory
    " May cause airline to misbehave
    "   let g:evervim_autochdir = 1

    " Default statusline is vim-airline
    " You can change to the more configurable lightline.vim by uncomment the following
    "   let g:evervim_use_lightline = 1

    " Header constants for generating and updating the comment header
    "   let g:header_field_author = 'YOUR_NAME'
    "   let g:header_field_author_email = 'YOUR_EMAIL_ADDRESS'

    " Startup Screen
    " You can customize the welcome message by changing the following line
    "   let g:evervim_welcome_message = "Code your life with EverVim!"

    " Leader keys
    "   let g:evervim_leader=','
    "   let g:evervim_localleader='\\'

    " Restore cursor
    " Automatically restore your cursor to the place you left
    " Disable by uncommenting the following line.
    "   let g:evervim_no_restore_cursor = 1

    " Linting engine
    " Use ALE by default. But if you are using an older version
    " of vim or experiencing issues with ALE, you can switch to
    " Syntastic by uncommenting the following line
    "   let g:evervim_use_syntastic = 1

    " Fuzzy Finder
    " By default, CtrlP is used on Windows and FZF.vim on Unix
    " Fall back to CtrlP by uncommenting the following line (Unix only)
    "   let g:evervim_use_ctrlp = 1

    " Enable smooth scrolling
    " Use physics-based smooth scrolling for half-page/full-page scrolling
    " Friction and air-drag can be override here
    "   let g:evervim_smooth_scrolling = 1

    " Enable transparent background on terminal vim/nvim
    "   let g:evervim_transparent_bg = 1

    " Disable easier moving in tabs and windows
    " only if you need <C-J> for jumping or other conflicting plugin
    " keybinding
    "   let g:evervim_no_easyWindows = 1

    " Disable wrap relative motion for start/end line motions
    "   let g:evervim_no_wrapRelMotion = 1

    " Disable fast tab navigation
    let g:evervim_no_fastTabs = 1

    " Enable NerdTree Sync across tabs
    " Synchronize view and focus between different tabs
    "   let g:evervim_nerdtree_tabs_sync = 1

    " Clear search highlighting
    "   let g:evervim_clear_search_highlight = 1

    " Disable neosnippet expansion
    " This maps over <C-k> and does some Supertab
    " emulation with snippets
    "   let g:evervim_no_neosnippet_expand = 1

    " Disable whitespace stripping
    "   let g:evervim_keep_trailing_whitespace = 1

    " vim files directory
    "   let g:evervim_consolidated_directory = <full path to desired directory>
    "   eg: let g:evervim_consolidated_directory = $HOME . '/.vim/'

    " This makes the completion popup strictly passive.
    " Keypresses acts normally. <ESC> takes you of insert mode, words don't
    " automatically complete, pressing <CR> inserts a newline, etc. Iff the
    " menu is open, tab will cycle through it. If a snippet is selected, <C-k>
    " expands it and jumps between fields.
    "   let g:evervim_noninvasive_completion = 1

    " Don't turn conceallevel or concealcursor
    "   let g:evervim_no_conceal = 1

    " Disable  omni complete
    "   let g:evervim_no_omni_complete = 1

    " Prefer indentguides
    "   let g:evervim_use_indentguides = 1

    " Prefer Neoformat over vim-autoformat
    "   let g:evervim_use_neoformat = 1

    " Disable autoformat on write
    " You can still use <Leader>fm to manually format the file
    "   let g:evervim_no_autoformat = 1

    " Hybrid Linenumber
    " Show absolute line number for current line and relative
    " for the rest
    "   let g:evervim_hybrid_linenumber = 1

    " 80 Column Warning
    " Shows a magenta line at column 81 only for those lines that exceeds 80
    "   let g:evervim_80_column_warning = 1

    " Minimap Support
    " Shows a minimap on the right hand side, need has_python
    "   let g:evervim_minimap

    " Don't create default mappings for multicursors
    " See :help multiple-cursors-mappings
    "   let g:multi_cursor_use_default_mapping=0
    "   let g:multi_cursor_next_key='<C-n>'
    "   let g:multi_cursor_prev_key='<C-p>'
    "   let g:multi_cursor_skip_key='<C-x>'
    "   let g:multi_cursor_quit_key='<Esc>'
    " Require a special keypress to enter multiple cursors mode
    "   let g:multi_cursor_start_key='+'

    " Mappings for editing/applying evervim config
    "   let g:evervim_edit_config_mapping='<leader>ec'
    "   let g:evervim_apply_config_mapping='<leader>ac'
" }

