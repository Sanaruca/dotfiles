-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Ctrl+j/k/l/i for window navigation (ijkl layout: j=left, i=up, k=down, l=right).
-- NOTE: <C-i> is indistinguishable from <Tab> in the terminal. Tab in normal mode
-- also fires "window up". Insert/command/visual mode is unaffected.
-- TODO: maybe change this later, want Ctrl+k+... combos like VSCode
-- instead of using Ctrl for window navigation.
vim.keymap.del("n", "<C-h>")
vim.keymap.set("n", "<C-j>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-i>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-k>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- ijkl (lowercase) = arrow keys. In visual mode they exit selection and just move.
vim.keymap.set("n", "i", "k", { desc = "Move up", remap = false })
vim.keymap.set("x", "i", "<Esc>k", { desc = "Exit visual and move up" })
vim.keymap.set("n", "j", "h", { desc = "Move left", remap = false })
vim.keymap.set("x", "j", "<Esc>h", { desc = "Exit visual and move left" })
vim.keymap.set("n", "k", "j", { desc = "Move down", remap = false })
vim.keymap.set("x", "k", "<Esc>j", { desc = "Exit visual and move down" })
vim.keymap.set("x", "l", "<Esc>l", { desc = "Exit visual and move right" })

-- <A-i> / <A-k> = move line(s) up/down (silent to avoid messages)
vim.keymap.set("n", "<A-i>", "<cmd>silent move .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-k>", "<cmd>silent move .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("x", "<A-i>", "<cmd>silent '<,'>move '<-2<cr>gv=gv", { desc = "Move lines up" })
vim.keymap.set("x", "<A-k>", "<cmd>silent '<,'>move '>+1<cr>gv=gv", { desc = "Move lines down" })

-- u = enter insert mode (replaces default i)
vim.keymap.set("n", "u", "i", { desc = "Enter insert mode" })

-- <C-z> = undo, <C-y> = redo
vim.keymap.set({ "n", "x" }, "<C-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "Undo" })
vim.keymap.set({ "n", "x" }, "<C-y>", "<C-r>", { desc = "Redo" })
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", { desc = "Redo" })

-- <C-p> = find files (like <space><space>)
vim.keymap.set("n", "<C-p>", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })

-- <C-a> = select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- d in visual mode deletes without yanking
vim.keymap.set("x", "d", '"_d', { desc = "Delete without yanking" })

-- <BS> in normal mode: if line is empty delete it (dd), otherwise delete previous
-- character and enter insert mode (Xi)
vim.keymap.set("n", "<BS>", function()
  if vim.fn.getline(".") == "" then
    vim.cmd("normal! dd")
  else
    vim.cmd("normal! X")
    vim.cmd("startinsert")
  end
end, { desc = "Backspace: delete char and insert, or delete empty line" })

-- cc = yank in visual mode
vim.keymap.set("x", "cc", "y", { desc = "Yank" })
-- ci = yank + move up (recursive)
vim.keymap.set("x", "ci", "ygvi", { desc = "Yank and move up" })
-- ck = yank + move down (recursive)
vim.keymap.set("x", "ck", "ygvk", { desc = "Yank and move down" })

-- <CR> = new line below without entering insert
vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "New line below" })


vim.keymap.set("n", "q", "b", { desc = "Move backward word" })

vim.keymap.set("n", "Q", "B", { desc = "Move backward WORD" })

vim.keymap.set("n", "I", "vk", { desc = "Visual select up", remap = false })
vim.keymap.set("x", "I", "k", { desc = "Extend selection up", remap = false })
vim.keymap.set("n", "J", "vh", { desc = "Visual select left", remap = false })
vim.keymap.set("x", "J", "h", { desc = "Extend selection left", remap = false })
vim.keymap.set("n", "K", "vj", { desc = "Visual select down", remap = false })
vim.keymap.set("x", "K", "j", { desc = "Extend selection down", remap = false })
vim.keymap.set("n", "L", "vl", { desc = "Visual select right", remap = false })
vim.keymap.set("x", "L", "l", { desc = "Extend selection right", remap = false })

-- Reduce timeoutlen in visual mode so i fires instantly (not waiting for inner text objects)
local vis_group = vim.api.nvim_create_augroup("VisualModeTimeout", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  group = vis_group,
  pattern = "*:*",
  callback = function()
    if vim.fn.mode():match("[vV\22]") then
      vim.g._saved_timeout = vim.g._saved_timeout or vim.o.timeoutlen
      vim.o.timeoutlen = 1
    else
      local saved = vim.g._saved_timeout
      vim.g._saved_timeout = nil
      if saved and vim.o.timeoutlen ~= saved then
        vim.o.timeoutlen = saved
      end
    end
  end,
})
