#! /bin/bash
source src/shared/settings.sh


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

affiche_changelog_unreleased_sur_deploiement_qualif() {
  payload=$(makePayload $1)
  echo -e '\n{"text":"'"$payload"'"}'

  curl -g -X  POST -H 'Content-type: application/json' --data "$payload" https://hooks.slack.com/services/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
}

makePayload() {
  changelog=$(cat ./$1/CHANGELOG-UNRELEASED.md | tail -n +5)
  changelog=${changelog//[\"]/\'} # cleaning changelog

  changelog_title="$1"
  echo '{
   "blocks": [
     {
      "type": "header",
      "text": {
        "type": "plain_text",
        "text":"'"$changelog_title"'"
        }
     },
     {
      "text": {
        "type": "mrkdwn",
        "text":"'"$changelog"'"
        },
      	"type": "section"
     },
     {
      "type": "divider"
     },
   ]
  }'
}

show_menus() {
    # clear
    echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "         Menu Principal"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "  0. Exit"
    echo "  1. Affiche le contenu du fichier \"CHANGELOG-UNRELEASED.md\" sur #deploiement-qualif"
    echo "  2. Met à jour les branches de qualif aved develop, envoie le statut sur #deploiement-qualif"
}





echo $repositories

# Mise à jour des repository
#forEachRepo updateDevelop

# Main menu handler loop
#while true
#do
#  show_menus
#  read_options
#done
