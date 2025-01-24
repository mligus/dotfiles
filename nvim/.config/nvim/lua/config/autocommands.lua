vim.api.nvim_command[[autocmd BufWritePre *.* :%s/\s\+$//e]]  -- trim whitespaces at the end of line
