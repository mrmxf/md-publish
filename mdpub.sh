# md-publish makedoc script - Linux
# -------------------------------------------------------------------

# _SETTINGS contains default settings. CONFIG folder is user overrides. create the current date as YYYY-MM-DD for convenience
printf -v MDPUB_DATE '%(%Y-%m-%d)T' -1
SCRIPT_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 ; pwd )"
TOOLS=$SCRIPT_FOLDER/tools
CONFIG_FILENAME=mdpub-CONFIG
CONFIG_PROJECT="$( pwd )/$CONFIG_FILENAME"
MDPUB_TITLE="md-publish by mrmxf"

# pull in the color highlighting & process command line options
source $TOOLS/_color.sh
source $TOOLS/_options.sh

#pull in the default settings & optional config
source $SCRIPT_FOLDER/$CONFIG_FILENAME >/dev/null 2>&1
source $CONFIG_PROJECT >/dev/null 2>&1

source $TOOLS/_action-echo-configuration.sh

# handle any actions
if [ "$ACTION" == "help"   ] ;  then source $TOOLS/_action-help.sh ; fi
if [ "$ACTION" == "init"   ] ;  then source $TOOLS/_action-init-project.sh ; fi
if [ "$ACTION" == "update" ] ;  then source $TOOLS/_action-update-tools.sh ; fi

# iterate over all yml files in the root folder and run pandoc
for f in $FILE_GLOB
do
  # reset the project config in case there is no config for this doc
  source $CONFIG_PROJECT >/dev/null 2>&1
  # locate the project cofig
  DOC_FOLDER=$( dirname $f )
  DOC_CONFIG_PATH="$DOC_FOLDER/$CONFIG_FILENAME"

  echo -e "${Cwarning}------------------->${Ctxt}    defaults=$Cfile$f$Coff"

  # if there is a document config the use it
  if [ -f $DOC_CONFIG_PATH ] ; then
    echo -e "${Cwarning}------------------->${Ctxt}mdpub-CONFIG=$Cfile$DOC_CONFIG_PATH$Coff"
    source $DOC_CONFIG_PATH
  fi

  RUN_SCRIPT="$DOC_FOLDER/$PRE_PROCESS_SCRIPT"
  # if there is a pre-process script then run it
  if [ -f $RUN_SCRIPT ] ; then
    EKO="${Cwarning}-->${Ctxt} pre-process${Cinfo}"
    ERO="${Cerror}--> pre-process ERROR${Cinfo}"
    echo -e "$EKO=$Cfile$RUN_SCRIPT$Coff"
    source $RUN_SCRIPT
  fi

  echo -e "${Cwarning}-->${Ctxt}pandoc$Coff"
  pandoc --defaults=$f

  RUN_SCRIPT="$DOC_FOLDER/$POST_PROCESS_SCRIPT"
  # if there is a post-process script then run it
  if [ -f $RUN_SCRIPT ] ; then
    EKO="${Cwarning}-->${Ctxt} post-process${Cinfo}"
    ERO="${Cerror}--> post-process ERROR${Cinfo}"
    echo -e "$EKO=$Cfile$RUN_SCRIPT$Coff"
    source $RUN_SCRIPT
  fi
done

#version is used to identify the right files
version=01
# copy any extra resources required to the output folder
#cp src-imf-reg-api-doc/ela-openapi.v$version.json         $output/element-a-openapi.json
