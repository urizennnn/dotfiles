local autosave_enabled = true

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
    pattern = "*",
    callback = function()
        if autosave_enabled then
            vim.cmd("silent! wa")
        end
    end,
})

function ToggleAutoSave()
    autosave_enabled = not autosave_enabled
    print("AutoSave is now " .. (autosave_enabled and "Enabled" or "Disabled"))
end

vim.api.nvim_create_user_command("AutoSave", ToggleAutoSave, {})

local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

local function create_floating_terminal(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.7)
    local height = opts.height or math.floor(vim.o.lines * 0.7)
    local col = opts.col or math.floor((vim.o.columns - width) / 2)
    local row = opts.row or math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(state.floating.buf) then
        buf = state.floating.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
        state.floating.buf = buf
    end

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })
    return { buf = buf, win = win }
end

local function toggle_tem()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_terminal({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("ScratchTerminal", toggle_tem, {})
vim.keymap.set({ "n", "t" }, "<leader>sc", toggle_tem, { noremap = true, silent = true })
