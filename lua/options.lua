require "nvchad.options"

-- add yours here!
-- simrat39/symbols-outline.nvim begin
require("symbols-outline").setup()
-- simrat39/symbols-outline.nvim end

-- utilyre/barbecue.nvim begin
require("barbecue").setup({
  create_autocmd = false, -- prevent barbecue from updating itself automatically
})

-- triggers CursorHold event faster
vim.opt.updatetime = 200

require("barbecue").setup({
  create_autocmd = false, -- prevent barbecue from updating itself automatically
})

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include this if you have set `show_modified` to `true`
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})
-- utilyre/barbecue.nvim end

-- ThePrimeagen/harpoon begin
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "add file to harpoon list" })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>ha", function() toggle_telescope(harpoon:list()) end, { desc = "telescope pick harpoon list" })
-- ThePrimeagen/harpoon end

-- SmiteshP/nvim-navbuddy begin
local navbuddy = require("nvim-navbuddy")

require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}
vim.keymap.set("n", "<leader>nv", function() require("nvim-navbuddy").open() end, { desc = "open navbuddy" })
-- SmiteshP/nvim-navbuddy end

-- onsails/lspkind.nvim begin
local lspkind = require('lspkind')
local cmp = require("cmp")
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = {
        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- can also be a function to dynamically calculate max width such as
        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        menu = 50, -- leading text (labelDetails)
        abbr = 50, -- actual suggestion item
      },
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        -- ...
        return vim_item
      end
    })
  }
}
-- onsails/lspkind.nvim end

-- debugloop/telescope-undo.nvim end
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
-- debugloop/telescope-undo.nvim end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
