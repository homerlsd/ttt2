#!/bin/bash   
perl -i -pe 'BEGIN{undef $/;} s/^ *?<listViews>.*<\/listViews>\n//smg' src/objects/*.object