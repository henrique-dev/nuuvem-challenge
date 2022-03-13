#!/bin/bash

if [ "$(git config --get remote.origin.url)" != 'git@github.com:project-olimpo/hera.gitt' ]
then
    echo "Changing nammes in project and project name"
    NAME='he'
    NAME="${NAME}ra"
    NAME_TO_REPLACE='he'
    NAME_TO_REPLACE="${NAME_TO_REPLACE}ra"
    UPPER_NAME_TO_REPLACE='HE'
    UPPER_NAME_TO_REPLACE="${UPPER_NAME_TO_REPLACE}RA"
    CLASS_NAME_TO_REPLACE="$(tr '[:lower:]' '[:upper:]' <<< ${NAME_TO_REPLACE:0:1})${NAME_TO_REPLACE:1}"
    NEW_CLASS_NAME=""
    if [ "$1" != '' ] && [ "$2" != '' ]
    then
        NAME="$1"
        PORT="$2"
        PORT_TO_REPLACE='SETUP_'
        PORT_TO_REPLACE="${PORT_TO_REPLACE}PORT"
        NEW_CLASS_NAME="$(tr '[:lower:]' '[:upper:]' <<< ${NAME:0:1})${NAME:1}"
        UPPER_NEW_NAME="$(tr '[:lower:]' '[:upper:]' <<< ${NAME})"

        find . -name '*'$NAME_TO_REPLACE'*' | while read FILE ; do
            newfile="$(echo ${FILE} |sed -e 's/'$NAME_TO_REPLACE'/'$NAME'/')" ;
            echo "Renaming file $FILE to $newfile"
            mv "${FILE}" "${newfile}" ;
        done

        echo $UPPER_NEW_NAME

        find . -type f -exec sed -i 's/'$NAME_TO_REPLACE'/'$NAME'/' {} +
        find . -type f -exec sed -i 's/'$PORT_TO_REPLACE'/'$PORT'/g' {} +
        find . -type f -exec sed -i 's/'$CLASS_NAME_TO_REPLACE'/'$NEW_CLASS_NAME'/' {} +
        find . -type f -exec sed -i 's/'$UPPER_NAME_TO_REPLACE'/'$UPPER_NEW_NAME'/' {} +

        echo "SELF DESTROYING SETUP"
        rm -- "$0"
        rm README.md
        echo "Updating git index"
        rm -f .git/index
        git reset
        echo "git add ."
        git add .
        echo "git commit"
        git commit -m "change project name ${NAME_TO_REPLACE} to $1 and the port for $2"
        echo "git push"
        git push
    fi
fi
