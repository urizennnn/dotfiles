require(***REMOVED***render-markdown***REMOVED***).setup({
	heading = {
		-- Turn on / off heading icon & background rendering
		enabled = true,
		-- Turn on / off any sign column related rendering
		sign = true,
		-- Determines how icons ***REMOVED***ll the available space:
		--  inline:  underlying '#'s are concealed resulting in a left aligned icon
		--  overlay: result is left padded with spaces to hide any additional '#'
		position = ***REMOVED***overlay***REMOVED***,
		-- Replaces '#+' of 'atx_h._marker'
		-- The number of '#' in the heading determines the 'level'
		-- The 'level' is used to index into the array using a cycle
		icons = { ***REMOVED***󰲡 ***REMOVED***, ***REMOVED***󰲣 ***REMOVED***, ***REMOVED***󰲥 ***REMOVED***, ***REMOVED***󰲧 ***REMOVED***, ***REMOVED***󰲩 ***REMOVED***, ***REMOVED***󰲫 ***REMOVED*** },
		-- Added to the sign column if enabled
		-- The 'level' is used to index into the array using a cycle
		signs = { ***REMOVED***󰫎 ***REMOVED*** },
		-- Width of the heading background:
		--  block: width of the heading text
		--  full:  full width of the window
		-- Can also be an array of the above values in which case the 'level' is used
		-- to index into the array using a clamp
		width = ***REMOVED***full***REMOVED***,
		-- Amount of padding to add to the left of headings
		left_pad = 0,
		-- Amount of padding to add to the right of headings when width is 'block'
		right_pad = 0,
		-- Minimum width to use for headings when width is 'block'
		min_width = 0,
		-- Determins if a border is added above and below headings
		border = false,
		-- Highlight the start of the border using the foreground highlight
		border_pre***REMOVED***x = false,
		-- Used above heading for border
		above = ***REMOVED***▄***REMOVED***,
		-- Used below heading for border
		below = ***REMOVED***▀***REMOVED***,
		-- The 'level' is used to index into the array using a clamp
		-- Highlight for the heading icon and extends through the entire line
		backgrounds = {
			***REMOVED***RenderMarkdownH1Bg***REMOVED***,
			***REMOVED***RenderMarkdownH2Bg***REMOVED***,
			***REMOVED***RenderMarkdownH3Bg***REMOVED***,
			***REMOVED***RenderMarkdownH4Bg***REMOVED***,
			***REMOVED***RenderMarkdownH5Bg***REMOVED***,
			***REMOVED***RenderMarkdownH6Bg***REMOVED***,
		},
		-- The 'level' is used to index into the array using a clamp
		-- Highlight for the heading and sign icons
		foregrounds = {
			***REMOVED***RenderMarkdownH1***REMOVED***,
			***REMOVED***RenderMarkdownH2***REMOVED***,
			***REMOVED***RenderMarkdownH3***REMOVED***,
			***REMOVED***RenderMarkdownH4***REMOVED***,
			***REMOVED***RenderMarkdownH5***REMOVED***,
			***REMOVED***RenderMarkdownH6***REMOVED***,
		},
	},
	code = {
		-- Turn on / off code block & inline code rendering
		enabled = true,
		-- Turn on / off any sign column related rendering
		sign = true,
		-- Determines how code blocks & inline code are rendered:
		--  none:     disables all rendering
		--  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
		--  language: adds language icon to sign column if enabled and icon + name above code blocks
		--  full:     normal + language
		style = ***REMOVED***full***REMOVED***,
		-- Determines where language icon is rendered:
		--  right: right side of code block
		--  left:  left side of code block
		position = ***REMOVED***left***REMOVED***,
		-- Amount of padding to add around the language
		language_pad = 0,
		-- An array of language names for which background highlighting will be disabled
		-- Likely because that language has background highlights itself
		disable_background = { ***REMOVED***diff***REMOVED*** },
		-- Width of the code block background:
		--  block: width of the code block
		--  full:  full width of the window
		width = ***REMOVED***full***REMOVED***,
		-- Amount of padding to add to the left of code blocks
		left_pad = 0,
		-- Amount of padding to add to the right of code blocks when width is 'block'
		right_pad = 0,
		-- Minimum width to use for code blocks when width is 'block'
		min_width = 0,
		-- Determins how the top / bottom of code block are rendered:
		--  thick: use the same highlight as the code body
		--  thin:  when lines are empty overlay the above & below icons
		border = ***REMOVED***thin***REMOVED***,
		-- Used above code blocks for thin border
		above = ***REMOVED***▄***REMOVED***,
		-- Used below code blocks for thin border
		below = ***REMOVED***▀***REMOVED***,
		-- Highlight for code blocks
		highlight = ***REMOVED***RenderMarkdownCode***REMOVED***,
		-- Highlight for inline code
		highlight_inline = ***REMOVED***RenderMarkdownCodeInline***REMOVED***,
	},
	dash = {
		-- Turn on / off thematic break rendering
		enabled = true,
		-- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
		-- The icon gets repeated across the window's width
		icon = ***REMOVED***─***REMOVED***,
		-- Width of the generated line:
		--  <integer>: a hard coded width value
		--  full:      full width of the window
		width = ***REMOVED***full***REMOVED***,
		-- Highlight for the whole line generated from the icon
		highlight = ***REMOVED***RenderMarkdownDash***REMOVED***,
	},
	bullet = {
		-- Turn on / off list bullet rendering
		enabled = true,
		-- Replaces '-'|'+'|'*' of 'list_item'
		-- How deeply nested the list is determines the 'level'
		-- The 'level' is used to index into the array using a cycle
		-- If the item is a 'checkbox' a conceal is used to hide the bullet instead
		icons = { ***REMOVED***●***REMOVED***, ***REMOVED***○***REMOVED***, ***REMOVED***◆***REMOVED***, ***REMOVED***◇***REMOVED*** },
		-- Padding to add to the left of bullet point
		left_pad = 0,
		-- Padding to add to the right of bullet point
		right_pad = 0,
		-- Highlight for the bullet icon
		highlight = ***REMOVED***RenderMarkdownBullet***REMOVED***,
	},
	-- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
	-- There are two special states for unchecked & checked de***REMOVED***ned in the markdown grammar
	checkbox = {
		-- Turn on / off checkbox state rendering
		enabled = true,
		-- Determines how icons ***REMOVED***ll the available space:
		--  inline:  underlying text is concealed resulting in a left aligned icon
		--  overlay: result is left padded with spaces to hide any additional text
		position = ***REMOVED***inline***REMOVED***,
		unchecked = {
			-- Replaces '[ ]' of 'task_list_marker_unchecked'
			icon = ***REMOVED***󰄱 ***REMOVED***,
			-- Highlight for the unchecked icon
			highlight = ***REMOVED***RenderMarkdownUnchecked***REMOVED***,
		},
		checked = {
			-- Replaces '[x]' of 'task_list_marker_checked'
			icon = ***REMOVED***󰱒 ***REMOVED***,
			-- Highligh for the checked icon
			highlight = ***REMOVED***RenderMarkdownChecked***REMOVED***,
		},
		-- De***REMOVED***ne custom checkbox states, more involved as they are not part of the markdown grammar
		-- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
		-- Can specify as many additional states as you like following the 'todo' pattern below
		--   The key in this case 'todo' is for healthcheck and to allow users to change its values
		--   'raw':       Matched against the raw text of a 'shortcut_link'
		--   'rendered':  Replaces the 'raw' value when rendering
		--   'highlight': Highlight for the 'rendered' icon
		custom = {
			todo = { raw = ***REMOVED***[-]***REMOVED***, rendered = ***REMOVED***󰥔 ***REMOVED***, highlight = ***REMOVED***RenderMarkdownTodo***REMOVED*** },
		},
	},
	quote = {
		-- Turn on / off block quote & callout rendering
		enabled = true,
		-- Replaces '>' of 'block_quote'
		icon = ***REMOVED***▋***REMOVED***,
		-- Whether to repeat icon on wrapped lines. Requires neovim >= 0.10. This will obscure text if
		-- not con***REMOVED***gured correctly with :h 'showbreak', :h 'breakindent' and :h 'breakindentopt'. A
		-- combination of these that is likely to work is showbreak = '  ' (2 spaces), breakindent = true,
		-- breakindentopt = '' (empty string). These values are not validated by this plugin. If you want
		-- to avoid adding these to your main con***REMOVED***guration then set them in win_options for this plugin.
		repeat_linebreak = false,
		-- Highlight for the quote icon
		highlight = ***REMOVED***RenderMarkdownQuote***REMOVED***,
	},
	callout = {
		note = { raw = ***REMOVED***[!NOTE]***REMOVED***, rendered = ***REMOVED***󰋽 Note***REMOVED***, highlight = ***REMOVED***RenderMarkdownInfo***REMOVED*** },
		tip = { raw = ***REMOVED***[!TIP]***REMOVED***, rendered = ***REMOVED***󰌶 Tip***REMOVED***, highlight = ***REMOVED***RenderMarkdownSuccess***REMOVED*** },
		important = { raw = ***REMOVED***[!IMPORTANT]***REMOVED***, rendered = ***REMOVED***󰅾 Important***REMOVED***, highlight = ***REMOVED***RenderMarkdownHint***REMOVED*** },
		warning = { raw = ***REMOVED***[!WARNING]***REMOVED***, rendered = ***REMOVED***󰀪 Warning***REMOVED***, highlight = ***REMOVED***RenderMarkdownWarn***REMOVED*** },
		caution = { raw = ***REMOVED***[!CAUTION]***REMOVED***, rendered = ***REMOVED***󰳦 Caution***REMOVED***, highlight = ***REMOVED***RenderMarkdownError***REMOVED*** },
		-- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
		abstract = { raw = ***REMOVED***[!ABSTRACT]***REMOVED***, rendered = ***REMOVED***󰨸 Abstract***REMOVED***, highlight = ***REMOVED***RenderMarkdownInfo***REMOVED*** },
		summary = { raw = ***REMOVED***[!SUMMARY]***REMOVED***, rendered = ***REMOVED***󰨸 Summary***REMOVED***, highlight = ***REMOVED***RenderMarkdownInfo***REMOVED*** },
		tldr = { raw = ***REMOVED***[!TLDR]***REMOVED***, rendered = ***REMOVED***󰨸 Tldr***REMOVED***, highlight = ***REMOVED***RenderMarkdownInfo***REMOVED*** },
		info = { raw = ***REMOVED***[!INFO]***REMOVED***, rendered = ***REMOVED***󰋽 Info***REMOVED***, highlight = ***REMOVED***RenderMarkdownInfo***REMOVED*** },
		todo = { raw = ***REMOVED***[!TODO]***REMOVED***, rendered = ***REMOVED***󰗡 Todo***REMOVED***, highlight = ***REMOVED***RenderMarkdownInfo***REMOVED*** },
		hint = { raw = ***REMOVED***[!HINT]***REMOVED***, rendered = ***REMOVED***󰌶 Hint***REMOVED***, highlight = ***REMOVED***RenderMarkdownSuccess***REMOVED*** },
		success = { raw = ***REMOVED***[!SUCCESS]***REMOVED***, rendered = ***REMOVED***󰄬 Success***REMOVED***, highlight = ***REMOVED***RenderMarkdownSuccess***REMOVED*** },
		check = { raw = ***REMOVED***[!CHECK]***REMOVED***, rendered = ***REMOVED***󰄬 Check***REMOVED***, highlight = ***REMOVED***RenderMarkdownSuccess***REMOVED*** },
		done = { raw = ***REMOVED***[!DONE]***REMOVED***, rendered = ***REMOVED***󰄬 Done***REMOVED***, highlight = ***REMOVED***RenderMarkdownSuccess***REMOVED*** },
		question = { raw = ***REMOVED***[!QUESTION]***REMOVED***, rendered = ***REMOVED***󰘥 Question***REMOVED***, highlight = ***REMOVED***RenderMarkdownWarn***REMOVED*** },
		help = { raw = ***REMOVED***[!HELP]***REMOVED***, rendered = ***REMOVED***󰘥 Help***REMOVED***, highlight = ***REMOVED***RenderMarkdownWarn***REMOVED*** },
		faq = { raw = ***REMOVED***[!FAQ]***REMOVED***, rendered = ***REMOVED***󰘥 Faq***REMOVED***, highlight = ***REMOVED***RenderMarkdownWarn***REMOVED*** },
		attention = { raw = ***REMOVED***[!ATTENTION]***REMOVED***, rendered = ***REMOVED***󰀪 Attention***REMOVED***, highlight = ***REMOVED***RenderMarkdownWarn***REMOVED*** },
		failure = { raw = ***REMOVED***[!FAILURE]***REMOVED***, rendered = ***REMOVED***󰅖 Failure***REMOVED***, highlight = ***REMOVED***RenderMarkdownError***REMOVED*** },
		fail = { raw = ***REMOVED***[!FAIL]***REMOVED***, rendered = ***REMOVED***󰅖 Fail***REMOVED***, highlight = ***REMOVED***RenderMarkdownError***REMOVED*** },
		missing = { raw = ***REMOVED***[!MISSING]***REMOVED***, rendered = ***REMOVED***󰅖 Missing***REMOVED***, highlight = ***REMOVED***RenderMarkdownError***REMOVED*** },
		danger = { raw = ***REMOVED***[!DANGER]***REMOVED***, rendered = ***REMOVED***󱐌 Danger***REMOVED***, highlight = ***REMOVED***RenderMarkdownError***REMOVED*** },
		error = { raw = ***REMOVED***[!ERROR]***REMOVED***, rendered = ***REMOVED***󱐌 Error***REMOVED***, highlight = ***REMOVED***RenderMarkdownError***REMOVED*** },
		bug = { raw = ***REMOVED***[!BUG]***REMOVED***, rendered = ***REMOVED***󰨰 Bug***REMOVED***, highlight = ***REMOVED***RenderMarkdownError***REMOVED*** },
		example = { raw = ***REMOVED***[!EXAMPLE]***REMOVED***, rendered = ***REMOVED***󰉹 Example***REMOVED***, highlight = ***REMOVED***RenderMarkdownHint***REMOVED*** },
		quote = { raw = ***REMOVED***[!QUOTE]***REMOVED***, rendered = ***REMOVED***󱆨 Quote***REMOVED***, highlight = ***REMOVED***RenderMarkdownQuote***REMOVED*** },
		cite = { raw = ***REMOVED***[!CITE]***REMOVED***, rendered = ***REMOVED***󱆨 Cite***REMOVED***, highlight = ***REMOVED***RenderMarkdownQuote***REMOVED*** },
	},
	link = {
		-- Turn on / off inline link icon rendering
		enabled = true,
		-- Inlined with 'image' elements
		image = ***REMOVED***󰥶 ***REMOVED***,
		-- Inlined with 'email_autolink' elements
		email = ***REMOVED***󰀓 ***REMOVED***,
		-- Fallback icon for 'inline_link' elements
		hyperlink = ***REMOVED***󰌹 ***REMOVED***,
		-- Applies to the fallback inlined icon
		highlight = ***REMOVED***RenderMarkdownLink***REMOVED***,
		-- De***REMOVED***ne custom destination patterns so icons can quickly inform you of what a link
		-- contains. Applies to 'inline_link' and wikilink nodes.
		-- Can specify as many additional values as you like following the 'web' pattern below
		--   The key in this case 'web' is for healthcheck and to allow users to change its values
		--   'pattern':   Matched against the destination text see :h lua-pattern
		--   'icon':      Gets inlined before the link text
		--   'highlight': Highlight for the 'icon'
		custom = {
			web = { pattern = ***REMOVED***^http[s]?://***REMOVED***, icon = ***REMOVED***󰖟 ***REMOVED***, highlight = ***REMOVED***RenderMarkdownLink***REMOVED*** },
		},
	},
	sign = {
		-- Turn on / off sign rendering
		enabled = true,
		-- Applies to background of sign text
		highlight = ***REMOVED***RenderMarkdownSign***REMOVED***,
	},
	indent = {
		-- Turn on / off org-indent-mode
		enabled = false,
		-- Amount of additional padding added for each heading level
		per_level = 2,
	},
})
