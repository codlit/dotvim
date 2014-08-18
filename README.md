My vim config files in MAC OSX!

Installation:

Firstly, make sure you have installed "Exuberant Ctags" and "GNU GLOBAL"

Nextly,execute following command in your term
<pre><code>cd
mv .vimrc{,.bak}
mv .vim{,.bak}
git clone https://github.com/codlit/dotvim.git ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qa
ln -s ~/.vim/.vimrc ~/.vimrc</code></pre>

Then, add ~/.vim/scripts to your $PATH
example: add "PATH=$HOME/.vim/scripts:$PATH" to ~/.bash_profile
