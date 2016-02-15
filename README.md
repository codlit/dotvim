# My vim config files!

## Installation:

- Firstly, make sure you have installed "Exuberant Ctags" and "GNU GLOBAL"
- Nextly, execute following command in your term

``` 
cd
mv .vimrc{,.bak}
mv .vim{,.bak}
git clone https://github.com/codlit/dotvim.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qa
```

- Then, add ~/.vim/scripts to your $PATH
  
  `eg: add "PATH=$HOME/.vim/scripts:$PATH" to ~/.bash_profile`
  
- Finally, set YouCompleteMe.
  
  - compile YouCompleteMe
    
    ``` 
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
    ```
    
  - `mkdir ycm_extra_conf` and find a file `.ycm_extra_conf.py` in bundle/YouCompleteMe.
    
  - copy the `.ycm_extra_conf.py` to `ycm_extra_conf/c.ycm_extra_conf.py` and `ycm_extra_conf/cpp.ycm_extra_conf.py`.
    
  - change `*.ycm_extra_conf.py` files.
    
  - you can use `echo | c++ -std=c++11 -stdlib=libc++ -v -E -x c++ -` to get include directories, and put them to `flags` with `-isystem` in `*.ycm_extra_conf.py`.