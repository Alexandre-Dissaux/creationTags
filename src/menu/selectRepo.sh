#! /bin/bash
source src/shared/stringRepository.sh
source src/shared/inputRepository.sh

select_repo() {
    show_repo_selected
#local valueSelected=0
#while true
#do
##show_repo_selected
##read_options
#done
    
}

show_repo_selected () {
   
    for i in "${!repositories[@]}"
    do
        echo "[$(show_indicator $repository)] $repository"
    done

}

show_indicator () {
    [[ $(containsIn $1 "${repositories_selected[@]}") -eq 1 ]] && echo "*" || echo " "
}
