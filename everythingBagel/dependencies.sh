checkDeps () {
    if [ -z "$(which bazelisk)" ];
    then
        printf "${DANGER}No bazelisk installed! Please install!${CLEAR}\n"
        exit 126
    fi

    if [ -z "$(which git)" ];
    then
        printf "${DANGER}No git installed! Please install!${CLEAR}\n"
        exit 126
    fi

    if [ -z "$(which yarn)" ];
    then
        printf "${DANGER}No yarn installed! Please install!${CLEAR}\n"
        exit 126
    fi
}
