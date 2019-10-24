My dotfiles and a simple dotfiles linker.

Just put your dotfiles in the `default` directory, without the dot.
Put your secret dotfiles in the `secrets` directory, it is ignored by git.
If you need some 'overrides', put them in a new directory and pass it to the script as an argument,
like this:

`./dotfiles fluxbox`

It will link `default`, then `secrets` and then the `fluxbox` directory, overriding existing links.


It works with directories too:

`default/.config/rofi/config.rasi` will be linked to `$HOME/.config/rasi/config.rasi`

If the path does not exits it will mkdir it for you.

If something that is not a link exists it will ask nicely what to do.


As for now, there no merging of default and overrides files:
it seems a pain in the ass to me, with only a little gain.

