if empty(glob('~/.config/nvim/autoload/plug.vim'))
    autocmd BufReadPost *.docx :%!pandoc -f docx -t markdown       silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd VimEnter * PlugInstall
endif