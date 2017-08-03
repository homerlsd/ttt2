if [[ $1 = true ]] && [ -d "patches" ]; then
    for patch in patches/*
    do
        echo "**** Applying $patch patch ****"
        git apply --reject "$patch"
    done
    echo '**** Removing .rej files ****'
    find . -name \*.rej -delete
fi

echo '**** Removing Installed WebLinks ****'
perl -i -pe 'BEGIN{undef $/;} s/^ *?<webLinks>\n\s*<fullName>[a-zA-Z0-9]*?__.*?<\/fullName>.*?<\/webLinks>\n//smg' src/objects/*.object