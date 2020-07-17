#!/bin/bash

# first we determine where we are
echo "FI: setting up variables";
lang=es;
kaDbDir=/root/.kalite/database;
piDir=/var/www;
plusDir=/media/RACHEL/rachel;
kaContent=/media/RACHEL/kacontent
#if [[ -d $plusDir ]]; then
#    echo "FI: we're on a plus";
#    webDir=$plusDir
#elif [[ -d $piDir ]]; then
#    echo "FI: we're on a pi";
    webDir=$piDir
#else
#    echo "Unknown System -- exiting";
#    exit 2;
#fi

modDir=$webDir/modules/$lang-kalite

# required for kalite script, which checks the environment for this
export USER=`whoami`;

# need to stop kalite while we move stuff around
echo "FI: stopping kalite";
kalite stop

# we don't need this on the new v3 RACHEL-Plus
# (main contentpacks already installed)
#if [[ ! -d /.data ]]; then
    # install the content pack for this language (takes some time :/)
    echo "FI: installing contentpack";
    kalite manage retrievecontentpack local $lang $modDir/$lang-contentpack.zip
#else
    # the content directory is different on the v3
#    kaContent=/.data/RACHEL/.kalite/content
#fi

# backup previous database
echo "FI: backing up old db";
mv $kaDbDir/content_khan_$lang.sqlite $kaDbDir/content_khan_$lang.$(date +%F);

# symlink new database
echo "FI: symlinking new db";
ln -s $modDir/content_khan_$lang.sqlite $kaDbDir/

# symlink the content (faster than a find, but limited to getconf ARG_MAX: 2097152 on RACHEL-Plus)
# then restart kalite properly
echo "FI: symlinking content";
#if [[ -d $piDir ]]; then
#    ln -sf $modDir/content/* /root/.kalite/content
    # on the pi we're behind nginx
#    echo "FI: restarting kalite on port 7007";
#    kalite restart --port=7007
#else
     ln -sf $modDir/content/* $kaContent
    echo "FI: restarting kalite on default port (8008)";
    kalite restart
#fi
