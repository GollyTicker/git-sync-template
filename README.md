# git-sync-scripts
Git Sync scripts for markdown-based knowledge-base files with correct sync for submodules and Git LFS on Android.

*Attention: These files are merely provided, because my private setup seems to solve some problems other people also had. You're best if you understand a bit about linux, command line, git and termux so that you can fix minor problems yourselves. These scripts are **NOT** intended as a jump-in immediately-user-friendly robust set of scripts, when used outside of their initial use-case.*

However, me and a few friends have been *robustly and consistently* using these scripts on Linux, Windows and Android via Termux. When the configuration is correct once, then it consistently works. Except, Git on Termux sometimes randomly has object errors (which seems to be a Termux issue, as it already happened with git before these scripts were used.). In that case, I simply manually copy my changes and re-clone my repository on Termux.

It's used to have a consistent git-sync workflow on Android via Termux and Linux+Windows - **including submodules and GitLFS syncing on Android.** (Which is a pain to get working, if you ever tried to simply use the normal way.)

[Context of why these scripts exist](https://github.com/denolehov/obsidian-git/issues/608)

## How to use with your markdown-based personal knowledgebase (e.g. Obsidian, Logseq, etc.)

1. Copy this folder of files into a directory `scripts` into your knowledge-base root folder.
e.g. If you knowledge-base is at `/path/to/my/knowledge-base` then put these files into `/path/to/my/knowledge-base/scripts`.
1. For each OS on which you want to synchronize your files:
    1. Ensure, that that OS has Git installed and that it can be accessed via `git` command line invocation.
    1. Use the `Sync_Knowledgebase_<OS>.md` from `templates` and copy it into this `scripts` folder.
    1. Adapt the lines with `ADAPT ME`. Essentially, you're telling it, where the knowledge-base is and which git commit message part should be used in `[MESSAGE_PART]`.
    1. You also want to investigate the files in `desktop` and `mobile`. They're used on these OS and makes their configuration different. For instance, by default the three main steps will prompt for continuation on mobile, but not on desktop. Also, certain files on mobile will have their changes ignored completely. You may want to add certain plugin files there.
1. Manually commit and push the `scripts` folder into your knowledge-base.
1. Ensure, that you have no changes to commit/push on mobile.
1. Completely remove the directory of your knowledge-base on mobile.
1. Fresh clone it using the `Initial_Clone_Android.sh` from the templates. You need to adapt the lines with `ADAPT ME`. This makes sure, that certain setups are correctly done.
1. Next for each OS, you want to check, that the invocation of the script actually works. Make a minor change and invoke the scripts. On mobile, you can add [Termux widgets](https://github.com/termux/termux-widget) to the Home screen, so that you can invoke the script from there directly. (Activating widget functionality costs 2$ once on Play Store IIRC.)
    * the scripts should work correctly on Linux, given that you have Git + LFS installed and the scripts correctly adapted.
    * on mobile, after doing the fresh clone, you'll encounter an error where the git post-commit hooks are trying to access `$HOME/.git`. This is fixed, if you add a symlink in your home directory called `.git` and point it to the `.git` of your knowledge-base repository root. e.g. `ln -s /path/to/my/knowledge-base/.git $HOME/.git`
        * After this fix, the mobile sync scripts should be working and should correctly pull, commit and push everything including submodules and LFS objects. 
1. Did your sync work? Congratz! You can take a look at the various `source.sh` files and make individual configuration if you want to.
1. Did your sync fail? Properly read the error message and try to see what could be causing it. If you cannot make it work after putting some effort, then describe your setup and [write an issue to this repository](https://github.com/GollyTicker/git-sync-template/issues/new).
