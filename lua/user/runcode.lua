local status_ok, codeRunner = pcall(require, "vim-terminator")
if not status_ok then
    return
end

codeRunner.setup {
    
}
