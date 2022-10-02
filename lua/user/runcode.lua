local status_ok, codeRunner = pcall(require, "vim-terminator")
if not status_ok then
    return
end


-- Key map	Description
-- <leader>ot	Opens (or reopens) a terminal window
-- <leader>or	Opens a repl
-- <leader>rf	Runs your current file (or visual selection) in the output buffer
-- <leader>rt	Runs your current file (or visual selection) in the terminal
-- <leader>rs	Stops the running job in the output buffer
-- <leader>rm	Modifies command via command line before running in output buffer
-- Pro tip: hit <c-f> on vims command line to further modify before running
-- <leader>sd	Send text in delimiter to terminal
-- <leader>ss	Sends visual selection to terminal
-- :TerminatorSendToTerminal echo "hi there"	Sends echo "hi there" to the terminal

codeRunner.setup {
    
}
