# git-pr
Git utility to allow quick GitHub Pull Request (PR) creation from command line using current active branch.

## Setup
1. Make this script executable: `chmod +x git-pr.sh`
2. Add it to local bin: `ln -s /path/to/git-pr.sh /usr/local/bin/git-pr`
3. Add alias into `~/.gitconfig`:
```
[alias]
    pr = "!git-pr"
```

## Config (optional)
You can specify the default branch against which the PR's should be created against in your git config.
You can set one value in your global config:
```
git config --add --global pr.default-branch master
```
And then you can specify a different value per each git repository:
```
git config --add pr.default-branch develop
```
If you choose not to have configured default(s), you will need to specify the branch on each command run

# Usage
```
git pr [--help|-h] [<branch>]

git pr                    -- make a PR against the configured default branch
git pr foo/bar            -- make a PR against branch foo/bar
git pr --help             -- show brief usage help
```

# Caveat
The remote repository to use is determined by taking the first entry from remotes list. This might be important if you work with more than one remote repository (e.g. forks)

# TODO
- Integrate with git autocomplete for branch names

# Authorship
Inspired and initial development by @asarturas
Updates and publishing by @mkilmanas
PRs, issues an comments welcome