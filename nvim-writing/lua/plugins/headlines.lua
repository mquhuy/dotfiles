return {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- config = true, -- or `opts = {}`
    opts = {
        markdown = {
            headline_highlights = {
                "Headline1",
                "Headline2"
                },
            fat_headlines = false,
            fat_headline_upper_string = "▃",
            --
            codeblock_highlight = "CodeBlock",
            --
            quote_highlight = "Quote",
            quote_string = "┃",
            -- quote_string = ">> ",
            --
            dash_highlight = "Dash",
            dash_string = "_",
        },
    }
}
