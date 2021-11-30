#! /bin/bash
source src/shared/stringRepository.sh
source src/shared/arrayRepository.sh
source src/shared/inputRepository.sh

select_repo() {
    local valueSelected=0
    local selectAll="${#repositories[@]}" # length of the array with "#"
    while [[ $valueSelected == +([0-9]) && $valueSelected -ge 0 && $valueSelected -le selectAll ]]; do
        clear

        echo "value selected : $valueSelected"
        echo "~~~~~~~~ Repository selection ~~~~~~~~"
        show_repo_selected $selectAll
        read valueSelected
        if [[ $valueSelected -ge 0 && $valueSelected -le selectAll ]]; then
            read_select_repo_options $valueSelected $selectAll
        fi
    done
}

read_select_repo_options() {
    [[ $1 -eq $2 ]] && selected_all_repo || select_or_unselect $1
}

selected_all_repo() {
    if [[ "${#repositories[@]}" -eq "${#repositories_selected[@]}" ]]; then # if all is already selected
        repositories_selected=() # put the array empty
    else 
        repositories_selected=("${repositories[@]}") # copy all the array
    fi
}

select_or_unselect() {
    local repository=$(getValueByIndex "${repositories[@]}" $1)
    if [[ $(show_indicator $repository)  = "*" ]]; then
        repositories_selected=${repositories_selected[@]/$repository}
    else
        repositories_selected+=$repository
    fi
}


show_repo_selected () {
    echo "Indicated a number for select or unselect a repository or an other value to validate your choices"
    for i in "${!repositories[@]}"
    do
        echo "[$(show_indicator "${repositories[$i]}")] $i. "${repositories[$i]}""
    done
    echo "[!] $1. Select all"

}

show_indicator () {
    [[ "${repositories_selected[*]}" =~ "$1" ]] && echo "*" || echo " "
}
