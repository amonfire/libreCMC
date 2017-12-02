How To Submit A Change To This Wiki
===================================

Clone this repo and:
--------------------

    git clone https://gogs.librecmc.org/libreCMC/libreCMC-wiki.git

then

    git push

or

    git request-pull -p

### git push ( In Gogs )

Clone the upstream repo in Gogs, then clone to your computer:

    git clone https://yourUserName@yourURL

Add upstream repo to be able to rebase to upstream point commit:

    git remote add upstream https://gogs.librecmc.org/libreCMC/libreCMC-wiki.git
    (git checkout -b optionalBranchName)
    git push (--all)

Create Push Request in Gogs:

* Press the little green PR button in your own repo
* Or go to <https://gogs.librecmc.org/libreCMC/libreCMC-wiki/pulls>

### git request-pull -p ( Anywhere )

Clone the upstream repo to your computer.

    git add changedFile.md
    git commit ( -m Short info what changed )
    git log ( copy commit id )
    git request-pull -p (start) URL (end)
    git request-pull -p (commit in upstream repo) URL master

Example for piping output to haste:

    git request-pull -p b3b8926484feb37c33e5150facf315ef12b4612e https://gogs.librecmc.org/jonasbits2/libreCMC-wiki.git master | haste

* Send to hastebin.com or any site you like
* Paste link in IRC channel

#### Links

* <https://www.git-scm.com/docs/git-request-pull>
* <https://hastebin.com/about.md>

