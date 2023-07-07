### The archy linux git aliases
Plenty of useful aliases for git

### Installation
#### AUR
You can install this package from AUR with your favorite AUR helpr
```sh
yay -S archy-git-aliases
```
And for more fun u can install `archy-git-aliases-git` also
```sh
paru archy-git-aliases-git
```
#### From source
* First you just need to install the [just task runner][just] 
* Then clone this repository 
    ```sh
    git clone --depth 1 https://github.com/archy-linux/archy-slstatus.archy-git-aliases.git
    ```
* And run the install task as a root
    ```
    just i # or just
    ```

### Aliases

| Alias    | Description                                                                                       |
|----------|---------------------------------------------------------------------------------------------------|
| co       | Shortcut for `checkout`, allows you to switch branches quickly.                                   |
| ci       | Shortcut for `commit`, simplifying the commit process.                                             |
| br       | Shortcut for `branch`, helping you create branches faster.                                         |
| st       | Shortcut for `status`, giving you a concise overview of the repository status.                    |
| df       | Shortcut for `diff`, showing the changes made to files.                                            |
| lg       | Displays a log of commit history in a customized format.                                           |
| lgg      | Displays a compact log of commit history with graph visualization.                                 |
| unstage  | Unstages changes from the index.                                                                   |
| last     | Shows the last commit.                                                                             |
| undo     | Reverts the last commit.                                                                           |
| pushf    | Forcefully pushes to a branch.                                                                     |
| squash   | Performs an interactive rebase to squash multiple commits into one.                                |
| amend    | Amends the last commit with the changes you've made.                                               |
| aliases  | Lists all your Git aliases.                                                                        |
| brl      | Lists all branches along with the commit they point to.                                            |
| uncommit | Undoes the last commit but keeps the changes as unstaged modifications.                            |
| hist     | Shows a compact summary of your commit history.                                                    |
| ff       | Performs a fast-forward merge, only if it's possible.                                              |
| shelve   | Stashes your changes and switches to a new branch.                                                 |
| unshelve | Applies the last stash and deletes it.                                                             |
| sync     | Fetches the latest changes from the remote repository and performs a rebase.                       |
| upstream | Sets the upstream branch for the current branch.                                                   |
| ignore   | Adds a file to the `.gitignore` file.                                                              |


