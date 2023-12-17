vim.g.mapleader = " "
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 4
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.clipboard = "unnamed"
vim.opt.belloff = "all"
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- 画面分割してもステータスラインが分割されないようにする
vim.opt.laststatus = 3
-- ステータスライン下部のモード表示を非表示にする
vim.opt.showmode = false

vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {silent = true})
vim.api.nvim_set_keymap('n', '<S-h>', '0', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-l>', '$', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', {noremap = true})
-- 左右分割
vim.api.nvim_set_keymap('n', 'sv', '<C-w>v', {noremap = true})
-- 上下分割
vim.api.nvim_set_keymap('n', 'ss', '<C-w>s', {noremap = true})
-- 左ペインに移動
vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', {noremap = true})
-- 右ペインに移動
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', {noremap = true})
-- 上ペインに移動
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', {noremap = true})
-- 下ペインに移動
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', {noremap = true})
-- init.luaを開くためのショートハンド
vim.api.nvim_set_keymap('n', '<Leader>.', ':e ~/.config/nvim/init.lua<CR>', {noremap = true})
-- ターミナルモードのショートカット
vim.api.nvim_set_keymap('n', 'tx', '<cmd>belowright new<CR><cmd>terminal<CR>', {noremap = true})


-- lazy.nvim
vim.loader.enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
 vim.fn.system({
   "git",
   "clone",
   "--filter=blob:none",
   "https://github.com/folke/lazy.nvim.git",
   "--branch=stable", -- latest stable release
   lazypath,
 })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- nvim-tree
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeToggle<CR>', {silent = true})
-- netrwを無効化（同じ機能でコンフリクトする可能性があるため）
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

-- coc.nvim
-- 補完メニューでenterクリック時の挙動（補完対象がある場合は現在の行、ない場合は次の行に行く）
vim.api.nvim_set_keymap('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', { noremap = true, silent = true, expr = true })

-- gruvbox-material 
if vim.fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true
end
vim.o.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
vim.cmd([[colorscheme gruvbox-material]])

-- telescope
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>Telescope live_grep<CR>', {noremap = true, silent = true})
