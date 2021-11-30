
### Update a repo on develop
# Param $1 : work dir for git
# Param $2 : work dir for git
# Param $3 : name of repo
# Param $4 : name of branch
update_repo_on_branch() {
  echo -e "~~~\nMise à jour de $3 sur la branch $4..."
  [ -d ./repo/$3 ] || git clone "$repository_url$3.git" "./repo/$3"

  git $1 $2 checkout $4
  git $1 $2 pull
}




