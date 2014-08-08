dotvim
======

An organic Vim configuration.

This is more or less a representation of my `~/.vim` directory.
A symlink can be used to reference the `vimrc.vim` file.

In general, I'd recommend against blindly copying a `vimrc`,
unless you're just experimenting. However, poking around the
configuration to get inspiration for your own `vimrc` is
a great use of time.

Note that you may need to install/patch some fonts in order to make
use of Lokaltog/vim-powerline.

Installing
----------

First, clone the project:

    cd
    git clone --recursive https://github.com/voithos/dotvim.git .vim

Next, create the symlink for `vimrc` (or copy, if you're on Windows):
    
    ln -s ~/.vim/vimrc.vim ~/.vimrc

If you're on a \*nix system, you'll need the patched fonts.

    cp ~/.vim/fonts/*.otf ~/.fonts/

Finally, just start up Vim, and NeoBundle will prompt you to install
your plugins.

Success!
