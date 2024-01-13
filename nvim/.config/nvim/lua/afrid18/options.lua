vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 4
vim.opt.incsearch = true
vim.opt.smartcase = true


vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = true
vim.opt.backupdir = os.getenv('HOME') .. '/.local/share/nvim/backup/'
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.showcmd = true
vim.opt.fillchars = { eob = " " }
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "fish"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.nrformats:append("alpha") -- increment letters


-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
-- vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end


-- Custom function to copy current (relative for project)filepath
local function copy_relative_path()
  -- Get the current file path
  local file_path = vim.fn.expand('%')
  -- Get the current working directory
  local cwd = vim.fn.getcwd()
  -- Find the relative path
  local relative_path = vim.fn.fnamemodify(file_path, ':.:.')
  -- Copy the relative path to the '+' register (system clipboard)
  vim.fn.setreg('+', relative_path)
  -- Optional: Print a message to confirm the action
  print('Relative path copied: ' .. relative_path)
end
vim.api.nvim_create_user_command('CopyRelativePath', copy_relative_path, {})
vim.api.nvim_set_keymap('n', '<leader>cp', '<cmd>CopyRelativePath<CR>', { noremap = true, silent = true })
