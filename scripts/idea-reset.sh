#!/bin/bash

idea_config_loc=~/.IntelliJIdea2018.3/config
jetbrain_prefs=~/.java/.userPrefs/jetbrains/idea/30a67a02

echo "Clearing idea eval configs:"
echo "Idea local config: ${idea_config_loc}"
echo "Jetbrains java config: ${jetbrain_prefs}"

rm -rf $idea_config_loc/eval && \
sed -i '/.*evl.*/d' $idea_config_loc/options/other.xml && \
rm -rf $jetbrain_prefs/evl*

echo "Idea eval configs wiped out!"
