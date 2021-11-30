#!/bin/bash

getIndexByValue() {
    array=("$@")
    value=${array[-1]}
    unset array[-1]

    for i in "${!array[@]}"; do
        [[ "${array[$i]}" = "${value}" ]] && echo "${i}"
    done
}

getValueByIndex() {
    array=("$@")
    index=${array[-1]}
    unset array[-1]

    for i in "${!array[@]}"; do
        [[ $i = "${index}" ]] && echo "${array[$i]}"
    done
}