My configuration files to keep sync'd between systems. Dropbox + Github = :)

    # If Dropbox is installed & synced:
    $ ln -s ~/Dropbox/dotfiles ~/.homesick/repos/dotfiles
    # Otherwise:
    $ homesick clone git@github.com:stevenhaddox/dotfiles.git
    # Finally:
    $ homesick symlink dotfiles
    $ ln -s ~/.homesick/repos/dotfiles/homes/os/.bash_(osx|linux) ~


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/stevenhaddox/dotfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

