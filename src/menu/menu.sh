#! /bin/bash

# Print the Menu
show_main_menu() {
    clear
    echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "         Menu Principal"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "  0. Exit"
    echo "  1. Faire un freeze qualif"
    echo "  2. Modifier la liste des repo à prendre en compte [En cours de DEV]"
    echo "  Liste des Repos pris en compte : "
    echo $([ -z "$repositories_selected" ] && echo "No repository selected" || echo $repositories_selected)
}

# Function to read menu input selection and take a action
read_options(){
    local choice
    # read -p "Enter choice [ 1 - 2 ] " choice
    read choice
    case $choice in
      0) exit 0;;
#      1) forEachRepo freeze_qualif;;
      1) freeze_qualif "sief-back";;
      2) select_repo;;
      #*) echo -e "${RED}Error : The choice you have selected does not exist${STD}"
      *) exit 0
    esac
    echo "Press any key to continue..."
    read choice
}