



### Print something on channel deploiement qualif
# Param $1 : payload
print_on_deploiement_qualif() {
  payload="$1"
  #echo -e '\n{"text":"'"$payload"'"}'
  echo -n "Sending message on deploiement-qualif.... Statut : "
  curl -g -X  POST -H 'Content-type: application/json' --data "$payload" https://hooks.slack.com/services/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
  echo ""
}

############ TODO : refacto functions below to make them generic

### Create payload of Changelog unreleased for freeze qualif
# Param $1 : name of repo
make_payload_freeze_qualif_abort() {

  changelog_title="$repository"
  echo '{
   "blocks": [
     {
      "type": "header",
      "text": {
        "type": "plain_text",
        "text":"'"$repository"'"
        }
     },
     {
      "text": {
        "type": "mrkdwn",
        "text":"'"Git diff failed on $repository, freeze qualif aborted for $repository only !\n You need to merge back manually..."'"
        },
      	"type": "section"
     },
     {
      "type": "divider"
     },
   ]
  }'
}


### Create payload to slack to inform of the qualif branch update
# Param $1 : name of repo
make_payload_failed_update_branch_qualif() {
  repository=$1
  changelog_title="$repository"
  echo '{
   "blocks": [
     {
      "type": "header",
      "text": {
        "type": "plain_text",
        "text":"'"$repository"'"
        }
     },
     {
      "text": {
        "type": "mrkdwn",
        "text":"'"$repository update on qualif failed ! Aborting freeze qualif for $repository..."'"
        },
      	"type": "section"
     },
     {
      "type": "divider"
     },
   ]
  }'
}

### Create payload of Changelog unreleased for freeze qualif
# Param $1 : name of repo
make_payload_changelog_unreleased() {
  changelog=$(cat ./repo/$1/CHANGELOG-UNRELEASED.md | tail -n +5)
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
        "text":"'"Freeze qualif done ! Branch qualif is up-to-date ! \n$changelog"'"
        },
      	"type": "section"
     },
     {
      "type": "divider"
     },
   ]
  }'
}