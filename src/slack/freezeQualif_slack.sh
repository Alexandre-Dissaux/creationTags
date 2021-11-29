



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