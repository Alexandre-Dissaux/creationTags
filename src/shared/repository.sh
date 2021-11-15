
# Take a function as parameter and execute it for every repositories selected
forEachRepo() {
  for repository in $repositories_selected
    do
      $1 $repository
    done
}