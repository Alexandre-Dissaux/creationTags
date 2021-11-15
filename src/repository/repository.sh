
### Update a repo on develop
# Param $1 : name of repo
updateDevelop() { # TODO : calling updateRepo
  echo -e "~~~\nMise à jour de $1..."
  dir="--git-dir=./$1/.git --work-tree=./$1"
  [ -d $1 ] || git clone "${1_url}$1.git"
  git $dir checkout develop
  git $dir pull
}

# updateRepo # TODO