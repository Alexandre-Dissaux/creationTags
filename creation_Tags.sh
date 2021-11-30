#! /bin/bash
source src/shared/settings.sh
source src/shared/constant.sh
source src/menu/menu.sh
source src/freezeQualif/freezeQualif.sh
source src/menu/selectRepo.sh
source src/shared/repository.sh
source src/shared/branchRepository.sh
source src/slack/freezeQualif_slack.sh




# TODO : Activate for Production
select_repo

# Main menu handler loop # TODO : Activate for Production

while true
do
    show_main_menu
    read_options
done
# forEachRepo freeze_qualif