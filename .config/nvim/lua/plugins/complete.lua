return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = function(_, opts)
    local cmp = require("cmp")
    local types = require("cmp.types")

    local function deprioritize_snippet(entry1, entry2)
      if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
        return false
      end
      if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
        return true
      end
    end
    table.insert(
      opts.sources,
      cmp.config.sources({
        { name = "emoji" },
        { name = "nvim_lsp" },
        { name = "vsnip" }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        { name = "ultisnips" }, -- For ultisnips users.
        { name = "snippy" }, -- For snippy users.
      }, {
        { name = "buffer" },
      })
    )
  end,
}
