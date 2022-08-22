local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	-- one of "all" or a list of languages
	ensure_installed = { "c", "make", "lua", "cpp", "cmake", "rust", "python", "javascript", "typescript", "dot", "go" , "java", "markdown", "org", "svelte", "vim", "yaml", "json", "toml", "scss", "http"}, 
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = false,
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
