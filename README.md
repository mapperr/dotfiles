My dotfiles and a simple dotfiles linker.

Just put your dotfiles in the `default` directory, without the dot.
Put your secret dotfiles in the `secrets` directory, it is ignored by git.
If you need some 'overrides', put them in a new directory and pass it to the script as an argument,
like this:

`./dotfiles fluxbox`

it will link `default`, then `secrets` and then the `fluxbox` directory, overriding existing links.

