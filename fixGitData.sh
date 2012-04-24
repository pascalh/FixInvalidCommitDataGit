#!/bin/sh

git filter-branch --env-filter '

an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"
 
if [ "$GIT_COMMITTER_NAME" = "pascal_old" ]
then
cn="pasal_new"
cm="pascal@foobar.de"
fi
if [ "$GIT_AUTHOR_NAME" = "pascal_old" ]
then
am="pascal@foobar.de"
an="pascal_new"
fi

export GIT_AUTHOR_EMAIL=$am
export GIT_COMMITTER_EMAIL=$cm
export GIT_AUTHOR_NAME=$an
export GIT_COMMITTER_NAME=$cn

'
