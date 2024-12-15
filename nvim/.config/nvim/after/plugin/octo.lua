require(***REMOVED***octo***REMOVED***).setup({
	use_local_fs = false, -- use local ***REMOVED***les on right side of reviews
	suppress_missing_scope = { projects_v2 = true },
	enable_builtin = true, -- shows a list of builtin actions when no action is provided
	default_remote = { ***REMOVED***upstream***REMOVED***, ***REMOVED***origin***REMOVED*** }, -- order to try remotes
	default_merge_method = ***REMOVED***commit***REMOVED***, -- default merge method which should be used when calling `Octo pr merge`, could be `commit`, `rebase` or `squash`
	ssh_aliases = {}, -- SSH aliases. e.g. `ssh_aliases = {[***REMOVED***github.com-work***REMOVED***] = ***REMOVED***github.com***REMOVED***}`
	picker = ***REMOVED***telescope***REMOVED***, -- or ***REMOVED***fzf-lua***REMOVED***
	picker_con***REMOVED***g = {
		use_emojis = false, -- only used by ***REMOVED***fzf-lua***REMOVED*** picker for now
		mappings = { -- mappings for the pickers
			open_in_browser = { lhs = ***REMOVED***<C-b>***REMOVED***, desc = ***REMOVED***open issue in browser***REMOVED*** },
			copy_url = { lhs = ***REMOVED***<C-y>***REMOVED***, desc = ***REMOVED***copy url to system clipboard***REMOVED*** },
			checkout_pr = { lhs = ***REMOVED***<C-o>***REMOVED***, desc = ***REMOVED***checkout pull request***REMOVED*** },
			merge_pr = { lhs = ***REMOVED***<C-r>***REMOVED***, desc = ***REMOVED***merge pull request***REMOVED*** },
		},
	},
	comment_icon = ***REMOVED***▎***REMOVED***, -- comment marker
	outdated_icon = ***REMOVED***󰅒 ***REMOVED***, -- outdated indicator
	resolved_icon = ***REMOVED*** ***REMOVED***, -- resolved indicator
	reaction_viewer_hint_icon = ***REMOVED*** ***REMOVED***, -- marker for user reactions
	user_icon = ***REMOVED*** ***REMOVED***, -- user icon
	timeline_marker = ***REMOVED*** ***REMOVED***, -- timeline marker
	timeline_indent = ***REMOVED***2***REMOVED***, -- timeline indentation
	right_bubble_delimiter = ***REMOVED******REMOVED***, -- bubble delimiter
	left_bubble_delimiter = ***REMOVED******REMOVED***, -- bubble delimiter
	github_hostname = ***REMOVED******REMOVED***, -- GitHub Enterprise host
	snippet_context_lines = 4, -- number or lines around commented lines
	gh_cmd = ***REMOVED***gh***REMOVED***, -- Command to use when calling Github CLI
	gh_env = {}, -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
	timeout = 5000, -- timeout for requests between the remote server
	ui = {
		use_signcolumn = false, -- show ***REMOVED***modi***REMOVED***ed***REMOVED*** marks on the sign column
		use_signstatus = true, -- show ***REMOVED***modi***REMOVED***ed***REMOVED*** marks on the status column
	},
	issues = {
		order_by = { -- criteria to sort results of `Octo issue list`
			***REMOVED***eld = ***REMOVED***CREATED_AT***REMOVED***, -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorder***REMOVED***eld)
			direction = ***REMOVED***DESC***REMOVED***, -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
		},
	},
	pull_requests = {
		order_by = { -- criteria to sort the results of `Octo pr list`
			***REMOVED***eld = ***REMOVED***CREATED_AT***REMOVED***, -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorder***REMOVED***eld)
			direction = ***REMOVED***DESC***REMOVED***, -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
		},
		always_select_remote_on_create = false, -- always give prompt to select base remote repo when creating PRs
	},
	***REMOVED***le_panel = {
		size = 10, -- changed ***REMOVED***les panel rows
		use_icons = true, -- use web-devicons in ***REMOVED***le panel (if false, nvim-web-devicons does not need to be installed)
	},
	colors = { -- used for highlight groups (see Colors section below)
		white = ***REMOVED***#ffffff***REMOVED***,
		grey = ***REMOVED***#2A354C***REMOVED***,
		black = ***REMOVED***#000000***REMOVED***,
		red = ***REMOVED***#fdb8c0***REMOVED***,
		dark_red = ***REMOVED***#da3633***REMOVED***,
		green = ***REMOVED***#acf2bd***REMOVED***,
		dark_green = ***REMOVED***#238636***REMOVED***,
		yellow = ***REMOVED***#d3c846***REMOVED***,
		dark_yellow = ***REMOVED***#735c0f***REMOVED***,
		blue = ***REMOVED***#58A6FF***REMOVED***,
		dark_blue = ***REMOVED***#0366d6***REMOVED***,
		purple = ***REMOVED***#6f42c1***REMOVED***,
	},
	mappings = {
		issue = {
			close_issue = { lhs = ***REMOVED***<leader>ic***REMOVED***, desc = ***REMOVED***close issue***REMOVED*** },
			reopen_issue = { lhs = ***REMOVED***<leader>io***REMOVED***, desc = ***REMOVED***reopen issue***REMOVED*** },
			list_issues = { lhs = ***REMOVED***<leader>il***REMOVED***, desc = ***REMOVED***list open issues on same repo***REMOVED*** },
			reload = { lhs = ***REMOVED***<C-r>***REMOVED***, desc = ***REMOVED***reload issue***REMOVED*** },
			open_in_browser = { lhs = ***REMOVED***<C-b>***REMOVED***, desc = ***REMOVED***open issue in browser***REMOVED*** },
			copy_url = { lhs = ***REMOVED***<C-y>***REMOVED***, desc = ***REMOVED***copy url to system clipboard***REMOVED*** },
			add_assignee = { lhs = ***REMOVED***<leader>aa***REMOVED***, desc = ***REMOVED***add assignee***REMOVED*** },
			remove_assignee = { lhs = ***REMOVED***<leader>ad***REMOVED***, desc = ***REMOVED***remove assignee***REMOVED*** },
			create_label = { lhs = ***REMOVED***<leader>lc***REMOVED***, desc = ***REMOVED***create label***REMOVED*** },
			add_label = { lhs = ***REMOVED***<leader>la***REMOVED***, desc = ***REMOVED***add label***REMOVED*** },
			remove_label = { lhs = ***REMOVED***<leader>ld***REMOVED***, desc = ***REMOVED***remove label***REMOVED*** },
			goto_issue = { lhs = ***REMOVED***<leader>gi***REMOVED***, desc = ***REMOVED***navigate to a local repo issue***REMOVED*** },
			add_comment = { lhs = ***REMOVED***<leader>ca***REMOVED***, desc = ***REMOVED***add comment***REMOVED*** },
			delete_comment = { lhs = ***REMOVED***<leader>cd***REMOVED***, desc = ***REMOVED***delete comment***REMOVED*** },
			next_comment = { lhs = ***REMOVED***]c***REMOVED***, desc = ***REMOVED***go to next comment***REMOVED*** },
			prev_comment = { lhs = ***REMOVED***[c***REMOVED***, desc = ***REMOVED***go to previous comment***REMOVED*** },
			react_hooray = { lhs = ***REMOVED***<leader>rp***REMOVED***, desc = ***REMOVED***add/remove 🎉 reaction***REMOVED*** },
			react_heart = { lhs = ***REMOVED***<leader>rh***REMOVED***, desc = ***REMOVED***add/remove ❤️ reaction***REMOVED*** },
			react_eyes = { lhs = ***REMOVED***<leader>re***REMOVED***, desc = ***REMOVED***add/remove 👀 reaction***REMOVED*** },
			react_thumbs_up = { lhs = ***REMOVED***<leader>r+***REMOVED***, desc = ***REMOVED***add/remove 👍 reaction***REMOVED*** },
			react_thumbs_down = { lhs = ***REMOVED***<leader>r-***REMOVED***, desc = ***REMOVED***add/remove 👎 reaction***REMOVED*** },
			react_rocket = { lhs = ***REMOVED***<leader>rr***REMOVED***, desc = ***REMOVED***add/remove 🚀 reaction***REMOVED*** },
			react_laugh = { lhs = ***REMOVED***<leader>rl***REMOVED***, desc = ***REMOVED***add/remove 😄 reaction***REMOVED*** },
			react_confused = { lhs = ***REMOVED***<leader>rc***REMOVED***, desc = ***REMOVED***add/remove 😕 reaction***REMOVED*** },
		},
		pull_request = {
			checkout_pr = { lhs = ***REMOVED***<leader>po***REMOVED***, desc = ***REMOVED***checkout PR***REMOVED*** },
			merge_pr = { lhs = ***REMOVED***<leader>pm***REMOVED***, desc = ***REMOVED***merge commit PR***REMOVED*** },
			squash_and_merge_pr = { lhs = ***REMOVED***<leader>psm***REMOVED***, desc = ***REMOVED***squash and merge PR***REMOVED*** },
			rebase_and_merge_pr = { lhs = ***REMOVED***<leader>prm***REMOVED***, desc = ***REMOVED***rebase and merge PR***REMOVED*** },
			list_commits = { lhs = ***REMOVED***<leader>pc***REMOVED***, desc = ***REMOVED***list PR commits***REMOVED*** },
			list_changed_***REMOVED***les = { lhs = ***REMOVED***<leader>pf***REMOVED***, desc = ***REMOVED***list PR changed ***REMOVED***les***REMOVED*** },
			show_pr_diff = { lhs = ***REMOVED***<leader>pd***REMOVED***, desc = ***REMOVED***show PR diff***REMOVED*** },
			add_reviewer = { lhs = ***REMOVED***<leader>va***REMOVED***, desc = ***REMOVED***add reviewer***REMOVED*** },
			remove_reviewer = { lhs = ***REMOVED***<leader>vd***REMOVED***, desc = ***REMOVED***remove reviewer request***REMOVED*** },
			close_issue = { lhs = ***REMOVED***<leader>ic***REMOVED***, desc = ***REMOVED***close PR***REMOVED*** },
			reopen_issue = { lhs = ***REMOVED***<leader>io***REMOVED***, desc = ***REMOVED***reopen PR***REMOVED*** },
			list_issues = { lhs = ***REMOVED***<leader>il***REMOVED***, desc = ***REMOVED***list open issues on same repo***REMOVED*** },
			reload = { lhs = ***REMOVED***<C-r>***REMOVED***, desc = ***REMOVED***reload PR***REMOVED*** },
			open_in_browser = { lhs = ***REMOVED***<C-b>***REMOVED***, desc = ***REMOVED***open PR in browser***REMOVED*** },
			copy_url = { lhs = ***REMOVED***<C-y>***REMOVED***, desc = ***REMOVED***copy url to system clipboard***REMOVED*** },
			goto_***REMOVED***le = { lhs = ***REMOVED***gf***REMOVED***, desc = ***REMOVED***go to ***REMOVED***le***REMOVED*** },
			add_assignee = { lhs = ***REMOVED***<leader>aa***REMOVED***, desc = ***REMOVED***add assignee***REMOVED*** },
			remove_assignee = { lhs = ***REMOVED***<leader>ad***REMOVED***, desc = ***REMOVED***remove assignee***REMOVED*** },
			create_label = { lhs = ***REMOVED***<leader>lc***REMOVED***, desc = ***REMOVED***create label***REMOVED*** },
			add_label = { lhs = ***REMOVED***<leader>la***REMOVED***, desc = ***REMOVED***add label***REMOVED*** },
			remove_label = { lhs = ***REMOVED***<leader>ld***REMOVED***, desc = ***REMOVED***remove label***REMOVED*** },
			goto_issue = { lhs = ***REMOVED***<leader>gi***REMOVED***, desc = ***REMOVED***navigate to a local repo issue***REMOVED*** },
			add_comment = { lhs = ***REMOVED***<leader>ca***REMOVED***, desc = ***REMOVED***add comment***REMOVED*** },
			delete_comment = { lhs = ***REMOVED***<leader>cd***REMOVED***, desc = ***REMOVED***delete comment***REMOVED*** },
			next_comment = { lhs = ***REMOVED***]c***REMOVED***, desc = ***REMOVED***go to next comment***REMOVED*** },
			prev_comment = { lhs = ***REMOVED***[c***REMOVED***, desc = ***REMOVED***go to previous comment***REMOVED*** },
			react_hooray = { lhs = ***REMOVED***<leader>rp***REMOVED***, desc = ***REMOVED***add/remove 🎉 reaction***REMOVED*** },
			react_heart = { lhs = ***REMOVED***<leader>rh***REMOVED***, desc = ***REMOVED***add/remove ❤️ reaction***REMOVED*** },
			react_eyes = { lhs = ***REMOVED***<leader>re***REMOVED***, desc = ***REMOVED***add/remove 👀 reaction***REMOVED*** },
			react_thumbs_up = { lhs = ***REMOVED***<leader>r+***REMOVED***, desc = ***REMOVED***add/remove 👍 reaction***REMOVED*** },
			react_thumbs_down = { lhs = ***REMOVED***<leader>r-***REMOVED***, desc = ***REMOVED***add/remove 👎 reaction***REMOVED*** },
			react_rocket = { lhs = ***REMOVED***<leader>rr***REMOVED***, desc = ***REMOVED***add/remove 🚀 reaction***REMOVED*** },
			react_laugh = { lhs = ***REMOVED***<leader>rl***REMOVED***, desc = ***REMOVED***add/remove 😄 reaction***REMOVED*** },
			react_confused = { lhs = ***REMOVED***<leader>rc***REMOVED***, desc = ***REMOVED***add/remove 😕 reaction***REMOVED*** },
			review_start = { lhs = ***REMOVED***<leader>vs***REMOVED***, desc = ***REMOVED***start a review for the current PR***REMOVED*** },
			review_resume = { lhs = ***REMOVED***<leader>vr***REMOVED***, desc = ***REMOVED***resume a pending review for the current PR***REMOVED*** },
		},
		review_thread = {
			goto_issue = { lhs = ***REMOVED***<leader>gi***REMOVED***, desc = ***REMOVED***navigate to a local repo issue***REMOVED*** },
			add_comment = { lhs = ***REMOVED***<leader>ca***REMOVED***, desc = ***REMOVED***add comment***REMOVED*** },
			add_suggestion = { lhs = ***REMOVED***<leader>sa***REMOVED***, desc = ***REMOVED***add suggestion***REMOVED*** },
			delete_comment = { lhs = ***REMOVED***<leader>cd***REMOVED***, desc = ***REMOVED***delete comment***REMOVED*** },
			next_comment = { lhs = ***REMOVED***]c***REMOVED***, desc = ***REMOVED***go to next comment***REMOVED*** },
			prev_comment = { lhs = ***REMOVED***[c***REMOVED***, desc = ***REMOVED***go to previous comment***REMOVED*** },
			select_next_entry = { lhs = ***REMOVED***]q***REMOVED***, desc = ***REMOVED***move to previous changed ***REMOVED***le***REMOVED*** },
			select_prev_entry = { lhs = ***REMOVED***[q***REMOVED***, desc = ***REMOVED***move to next changed ***REMOVED***le***REMOVED*** },
			select_***REMOVED***rst_entry = { lhs = ***REMOVED***[Q***REMOVED***, desc = ***REMOVED***move to ***REMOVED***rst changed ***REMOVED***le***REMOVED*** },
			select_last_entry = { lhs = ***REMOVED***]Q***REMOVED***, desc = ***REMOVED***move to last changed ***REMOVED***le***REMOVED*** },
			close_review_tab = { lhs = ***REMOVED***<C-c>***REMOVED***, desc = ***REMOVED***close review tab***REMOVED*** },
			react_hooray = { lhs = ***REMOVED***<leader>rp***REMOVED***, desc = ***REMOVED***add/remove 🎉 reaction***REMOVED*** },
			react_heart = { lhs = ***REMOVED***<leader>rh***REMOVED***, desc = ***REMOVED***add/remove ❤️ reaction***REMOVED*** },
			react_eyes = { lhs = ***REMOVED***<leader>re***REMOVED***, desc = ***REMOVED***add/remove 👀 reaction***REMOVED*** },
			react_thumbs_up = { lhs = ***REMOVED***<leader>r+***REMOVED***, desc = ***REMOVED***add/remove 👍 reaction***REMOVED*** },
			react_thumbs_down = { lhs = ***REMOVED***<leader>r-***REMOVED***, desc = ***REMOVED***add/remove 👎 reaction***REMOVED*** },
			react_rocket = { lhs = ***REMOVED***<leader>rr***REMOVED***, desc = ***REMOVED***add/remove 🚀 reaction***REMOVED*** },
			react_laugh = { lhs = ***REMOVED***<leader>rl***REMOVED***, desc = ***REMOVED***add/remove 😄 reaction***REMOVED*** },
			react_confused = { lhs = ***REMOVED***<leader>rc***REMOVED***, desc = ***REMOVED***add/remove 😕 reaction***REMOVED*** },
		},
		submit_win = {
			approve_review = { lhs = ***REMOVED***<C-a>***REMOVED***, desc = ***REMOVED***approve review***REMOVED*** },
			comment_review = { lhs = ***REMOVED***<C-m>***REMOVED***, desc = ***REMOVED***comment review***REMOVED*** },
			request_changes = { lhs = ***REMOVED***<C-r>***REMOVED***, desc = ***REMOVED***request changes review***REMOVED*** },
			close_review_tab = { lhs = ***REMOVED***<C-c>***REMOVED***, desc = ***REMOVED***close review tab***REMOVED*** },
		},
		review_diff = {
			submit_review = { lhs = ***REMOVED***<leader>vs***REMOVED***, desc = ***REMOVED***submit review***REMOVED*** },
			discard_review = { lhs = ***REMOVED***<leader>vd***REMOVED***, desc = ***REMOVED***discard review***REMOVED*** },
			add_review_comment = { lhs = ***REMOVED***<leader>ca***REMOVED***, desc = ***REMOVED***add a new review comment***REMOVED*** },
			add_review_suggestion = { lhs = ***REMOVED***<leader>sa***REMOVED***, desc = ***REMOVED***add a new review suggestion***REMOVED*** },
			focus_***REMOVED***les = { lhs = ***REMOVED***<leader>e***REMOVED***, desc = ***REMOVED***move focus to changed ***REMOVED***le panel***REMOVED*** },
			toggle_***REMOVED***les = { lhs = ***REMOVED***<leader>b***REMOVED***, desc = ***REMOVED***hide/show changed ***REMOVED***les panel***REMOVED*** },
			next_thread = { lhs = ***REMOVED***]t***REMOVED***, desc = ***REMOVED***move to next thread***REMOVED*** },
			prev_thread = { lhs = ***REMOVED***[t***REMOVED***, desc = ***REMOVED***move to previous thread***REMOVED*** },
			select_next_entry = { lhs = ***REMOVED***]q***REMOVED***, desc = ***REMOVED***move to previous changed ***REMOVED***le***REMOVED*** },
			select_prev_entry = { lhs = ***REMOVED***[q***REMOVED***, desc = ***REMOVED***move to next changed ***REMOVED***le***REMOVED*** },
			select_***REMOVED***rst_entry = { lhs = ***REMOVED***[Q***REMOVED***, desc = ***REMOVED***move to ***REMOVED***rst changed ***REMOVED***le***REMOVED*** },
			select_last_entry = { lhs = ***REMOVED***]Q***REMOVED***, desc = ***REMOVED***move to last changed ***REMOVED***le***REMOVED*** },
			close_review_tab = { lhs = ***REMOVED***<C-c>***REMOVED***, desc = ***REMOVED***close review tab***REMOVED*** },
			toggle_viewed = { lhs = ***REMOVED***<leader><leader>***REMOVED***, desc = ***REMOVED***toggle viewer viewed state***REMOVED*** },
			goto_***REMOVED***le = { lhs = ***REMOVED***gf***REMOVED***, desc = ***REMOVED***go to ***REMOVED***le***REMOVED*** },
		},
		***REMOVED***le_panel = {
			submit_review = { lhs = ***REMOVED***<leader>vs***REMOVED***, desc = ***REMOVED***submit review***REMOVED*** },
			discard_review = { lhs = ***REMOVED***<leader>vd***REMOVED***, desc = ***REMOVED***discard review***REMOVED*** },
			next_entry = { lhs = ***REMOVED***j***REMOVED***, desc = ***REMOVED***move to next changed ***REMOVED***le***REMOVED*** },
			prev_entry = { lhs = ***REMOVED***k***REMOVED***, desc = ***REMOVED***move to previous changed ***REMOVED***le***REMOVED*** },
			select_entry = { lhs = ***REMOVED***<cr>***REMOVED***, desc = ***REMOVED***show selected changed ***REMOVED***le diffs***REMOVED*** },
			refresh_***REMOVED***les = { lhs = ***REMOVED***R***REMOVED***, desc = ***REMOVED***refresh changed ***REMOVED***les panel***REMOVED*** },
			focus_***REMOVED***les = { lhs = ***REMOVED***<leader>e***REMOVED***, desc = ***REMOVED***move focus to changed ***REMOVED***le panel***REMOVED*** },
			toggle_***REMOVED***les = { lhs = ***REMOVED***<leader>b***REMOVED***, desc = ***REMOVED***hide/show changed ***REMOVED***les panel***REMOVED*** },
			select_next_entry = { lhs = ***REMOVED***]q***REMOVED***, desc = ***REMOVED***move to previous changed ***REMOVED***le***REMOVED*** },
			select_prev_entry = { lhs = ***REMOVED***[q***REMOVED***, desc = ***REMOVED***move to next changed ***REMOVED***le***REMOVED*** },
			select_***REMOVED***rst_entry = { lhs = ***REMOVED***[Q***REMOVED***, desc = ***REMOVED***move to ***REMOVED***rst changed ***REMOVED***le***REMOVED*** },
			select_last_entry = { lhs = ***REMOVED***]Q***REMOVED***, desc = ***REMOVED***move to last changed ***REMOVED***le***REMOVED*** },
			close_review_tab = { lhs = ***REMOVED***<C-c>***REMOVED***, desc = ***REMOVED***close review tab***REMOVED*** },
			toggle_viewed = { lhs = ***REMOVED***<leader><leader>***REMOVED***, desc = ***REMOVED***toggle viewer viewed state***REMOVED*** },
		},
	},
})
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***pr***REMOVED***, ***REMOVED***<Cmd>Octo pr list<CR>***REMOVED***)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>O***REMOVED***, ***REMOVED***<cmd>Octo<CR>***REMOVED***)
