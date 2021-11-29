
mise_a_jour_qualif_avec_develop() {
  echo $1
  dir="--git-dir=./$1/.git --work-tree=./$1"
  git $dir status
  git $dir push --force origin HEAD:qualif

  payload_text="- $1 mis à jour sur qualif"
  echo $payload_text
  payload='{"text":"'$payload_text'"}'
  curl -g -X  POST -H 'Content-type: application/json' --data "$payload" https://hooks.slack.com/services/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
}


#      1) forEachRepo affiche_changelog_unreleased_sur_deploiement_qualif;;
#      2) forEachRepo mise_a_jour_qualif_avec_develop;;
