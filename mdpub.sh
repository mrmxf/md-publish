!/usr/bin/bash
## mdpub main script - make docs or do an option e.g. mdpub --help
## (C) MrMXF 2020
##
## issues https://github.com/mrmxf/md-publish/issues
##
## mdpu
# -------------------------------------------------------------------

# _SETTINGS contains default settings. CONFIG folder is user overrides. create the current date as YYYY-MM-DD for convenience
printf -v MDPUB_DATE '%(%Y-%m-%d)T' -1
ZMPFolder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 ; pwd )"
ZMPTools=$ZMPFolder/tools
ZMPConfigFile=zmp-CONFIG
ZMPProjectConfigFile="$( pwd )/$ZMPConfigFile"
ZMPTitle="zmp by mrmxf"
ZMPVersion="0.5.0"

# pull in the color highlighting & process command line options
source $ZMPTools/_color.sh
source $ZMPTools/_options.sh

ZA02="${Cwarning}-->${Ctxt}"
ZA18="${Cwarning}------------------>${Ctxt}"
ZE02="${Cerror}-->"

#pull in the default settings & optional config
source $ZMPFolder/$ZMPConfigFile >/dev/null 2>&1
source $ZMPProjectConfigFile >/dev/null 2>&1

source $ZMPTools/_action-echo-configuration.sh

# handle any actions
if [ "$ACTION" == "help"   ] ;  then source $ZMPTools/_action-help.sh ; fi
if [ "$ACTION" == "init"   ] ;  then source $ZMPTools/_action-init-project.sh ; fi
if [ "$ACTION" == "update" ] ;  then source $ZMPTools/_action-update-ZMPTools.sh ; fi

# iterate over all yml files in the root folder and run pandoc
for f in $ZMPGlob
do
  # reset the project config in case there is no config for this doc
  source $ZMPProjectConfigFile >/dev/null 2>&1
  # locate the project cofig
  ZMPDocPath=$( dirname $f )
  DOC_CONFIG_PATH="$ZMPDocPath/$ZMPConfigFile"

  echo -e "$ZA18    defaults=$Cfile$f$Coff"

  # if there is a document config the use it
  if [ -f $DOC_CONFIG_PATH ] ; then
    echo -e "$ZA18  zmp-CONFIG=$Cfile$DOC_CONFIG_PATH$Coff"
    source $DOC_CONFIG_PATH
  fi

  # if there is a zmp-init script then run it
  EKO="$ZA02 zmp-init${Cwarning}>${Cinfo}"
  ZMPScriptPath="$ZMPDocPath/$ZMPDocInit"
  if [ -f $ZMPScriptPath ] ; then
    ERO="$ZE02 zmp-init ERROR${Cinfo}"
    echo -e "$EKO script: $Cfile$ZMPScriptPath$Coff"
    source $ZMPScriptPath
  else
    echo -e "$EKO=$Cfile$ZMPScriptPath$Cwarning not found$Coff"
  fi

  ZMPCmd="pandoc --defaults=$f"
  echo -e "$ZA02$Ccmd $ZMPCmd $Coff"
  # use process substitution to read pandoc output into a string array
  readarray -t arrayOfStdOut < <(pandoc --defaults=$f 2>&1)
  #Print pandoc output line by line
  for LL in "${arrayOfStdOut[@]}"; do echo -e "   $ZA02$Cinfo $LL" ; done

  # if there is a zmp-post script then run it
  ZMPScriptPath="$ZMPDocPath/$ZMPDocPost"
  EKO="$ZA02 zmp-post${Cwarning}>${Cinfo}"
  if [ -f $ZMPScriptPath ] ; then
    ERO="$ZE02 zmp-post ERROR${Cinfo}"
    echo -e "$EKO script: $Cfile$ZMPScriptPath$Coff"
    source $ZMPScriptPath
  else
    echo -e "$EKO=$Cfile$ZMPScriptPath$Cwarning not found$Coff"
  fi
done

#version is used to identify the right files
version=01
# copy any extra resources required to the output folder
#cp src-imf-reg-api-doc/ela-openapi.v$version.json         $output/element-a-openapi.json
