## Problem and context
When I upgrade my macos to High Sierra, I received errors like:

> dyld: Library not loaded: /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/libruby.2.0.0.dylib
> 

The simplest solution is to upgrade homebrew and clean install vim and mvim.

## Clean installation
- First, get the latest homebrew.

```
brew grade
```

- Clean install vim and macvim

```
brew uninstall --purge macvim
brew uninstall --purge vim
brew install macvim
brew install vim --with-override-system-vi
brew linkapps
```

It is important to notice: by append _with-override-system-vi_, brew creates symlink from `usr/bin/vi` to `/usr/bin/vim`. 

- If we want to see other brew options, command is :

```
brew options macvim
```

## Make Finder Alias
Although macvim can now be found in LaunchPad as `MacVim.app` thanks to `linkapps` command, but the created artifact is a symlink under `/Application/` to `MacVim.app`, which is, however, not a _Finder Alias_.

Here are two ways to create Finder Alias: 1) Manual creation. 2) Programmatically create Finder Alias. Suppose we have macvim 8.0-144_3.

- Manual Creation. 

Open the Finder repository,

```
open /usr/local/Cellar/macvim/8.0-144_3
```

Create Finder Alias of `MacVim.app` and put it in `/Application/`.

- Programmactial way. Execute the following osascript,

```
osascript -e 'tell application "Finder" to make alias file to POSIX file "/usr/local/Cellar/macvim/8.0-144_3/MacVim.app" at POSIX file "/Applications/"'
```



