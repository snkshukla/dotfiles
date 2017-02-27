This repo has my vim and zsh configuration:
- The ```.vim``` directory has a ```vimrc``` file, just creating a soft link to this repo's ```.vim``` file in your home directory would make it work.
```
ln -s dotfiles/.vim ~/
ln -s dotfiles/.zshrc ~/
ln -s dotfiles/.git_template ~/
ln -s dotfiles/.gitignore ~/
```
- There is a `.zshrc` file which you can create a symlink for in your home directory.
- The theme used in the `zshrc` is [Cobalt2-iterm](https://github.com/wesbos/Cobalt2-iterm).
- Colorscheme used in `zshrc` is, `AfterGlow`, change the colors manually, get themes here, [All themes](https://github.com/mbadolato/iTerm2-Color-Schemes)
- `brew install zsh-syntax-highlighting` to enable the syntax highlighting.
- The `git_template` directory has the hooks for ctags, i.e. post_commit, post_checkout etc. You can create a symlink in your home directory to this directory.
- Setting up ctags for vim:
```
$ brew install ctags
$ ctags -R -f ./.git/tags .
