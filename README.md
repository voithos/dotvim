dotvim
======

An organic Vim configuration, using Vundle.

This is more or less a representation of my `~/.vim` directory.
A symlink can be used to reference the `vimrc.vim` file.

In general, I'd recommend against blindly copying a `vimrc`,
unless you're just experimenting. However, poking around the
configuration to get inspiration for your own `vimrc` is
a great use of time.

Installing
----------

First, clone the project:

    cd
    git clone --recursive git://github.com/voithos/dotvim.git .vim

Next, create the symlink:
    
    ln -s ~/.vim/vimrc.vim ~/.vimrc

Finally, run Vundle to install the plugins:

    :BundleInstall

Success!
