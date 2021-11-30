

freeze_qualif() {
  local repository=$1
  local dir="--git-dir=./repo/$repository/.git --work-tree=./repo/$repository"
  echo "You entered in freeze qualif on the repository $repository"
  update_repo_on_branch $dir $repository "develop" # TODO uncomment for PROD
  #echo "RESULT : $(make_payload_freeze_qualif_abort $repository)"

  if [[ -z $(git_diff $dir) ]]; then
    if [[ $(mise_a_jour_qualif_avec_develop $repository) -eq 1 ]]; then
      print_on_deploiement_qualif "$(make_payload_changelog_unreleased $repository)"
      echo "Freeze qualif for $repository DONE successfully !"
    else
      print_on_deploiement_qualif "$(make_payload_failed_update_branch_qualif $repository)"
      echo "$repository update on qualif failed ! Aborting freeze qualif for $repository..."
    fi
  else
    print_on_deploiement_qualif "$(make_payload_freeze_qualif_abort $repository)"
    echo "Git diff failed on $repository, freeze qualif aborted for $repository only ! You need to merge back manually..."
  fi
}

### Check if the git diff empty between develop/qualif and master
# Param $1 : work dir for git
git_diff() {
  #echo "$(git $1 diff --name-status origin/develop...origin/master)$(git $1 diff --name-status origin/qualif...origin/master)" 
  echo "$(git $1 diff --name-status origin/develop...origin/master)" 
}



mise_a_jour_qualif_avec_develop() {
  dir="--git-dir=./repo/$1/.git --work-tree=./repo/$1"
  git $dir push --force origin HEAD:qualif

  [[ -z "$(git $dir diff --name-status origin/develop...origin/qualif)" ]] && echo 1 || echo 0
}