#! /bin/bash
# To git pull over all subdirectories
cd ~/.vim/pack/default/start && find . -mindepth 1 -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;

# Ref: https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories/28348077
#
# find . searches the current directory
# -mindepth 1 -maxdepth 1 for a maximum depth of one sub-directory
# -type d to find directories, not files
# -exec {} \; runs a custom command for every find
# git --git-dir={}/.git --work-tree=$PWD/{} pull git pulls the individual directories

# To play around with find, I recommend using echo after -exec to preview, e.g.:
# find . -type d -depth 1 -exec echo git --git-dir={}/.git --work-tree=$PWD/{} status \;
