# md-publish makedoc script - Linux
# -------------------------------------------------------------------

# _SETTINGS contains default settings. CONFIG folder is user overrides. create the current date as YYYY-MM-DD for convenience
printf -v MDPUB_DATE '%(%Y-%m-%d)T' -1
SCRIPT_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 ; pwd )"
CONFIG_FILENAME=mdpub-CONFIG
CONFIG_PATH="$( pwd )/$CONFIG_FILENAME"

# set up some colors to make the output pretty
Coff="\e[0m"
 Cblack="\e[30m"  ;  Cred="\e[31m"  ;  Cgreen="\e[32m"  ;  Cyellow="\e[33m"  ;  Cblue="\e[34m"  ;  Cmagenta="\e[35m"  ;  Ccyan="\e[36m"  ;  Cwhite="\e[37m"  ;  Cgray="\e[90m"
CSblack="\e[90m"  ; CSred="\e[91m"  ; CSgreen="\e[92m"  ; CSyellow="\e[93m"  ; CSblue="\e[94m"  ; CSmagenta="\e[95m"  ; CScyan="\e[96m"  ; CSwhite="\e[97m"  ; CSgray="\e[37m"
 Bblack="\e[40m"  ;  Bred="\e[41m"  ;  Bgreen="\e[42m"  ;  Byellow="\e[43m"  ;  Bblue="\e[44m"  ;  Bmagenta="\e[45m"  ;  Bcyan="\e[46m"  ;  Bwhite="\e[47m"  ;  Bgray="\e[100m"
BSblack="\e[100m" ; BSred="\e[101m" ; BSgreen="\e[102m" ; BSyellow="\e[103m" ; BSblue="\e[104m" ; BSmagenta="\e[105m" ; BScyan="\e[106m" ; BSwhite="\e[107m" ; BSgray="\e[47m"
Ccmd=$Cgreen ; Curl=$Ccyan ; Ctxt=$Cyellow ; Cinfo=$Cgray ; Cerror=$Cred ; Cwarning=$CSmagenta ; Cfile=$Cwhite ; Cheading=$CScyan
 CC=$Ccmd    ; CU=$Curl    ; CT=$Ctxt      ; CI=$Cinfo    ; CE=$Cerror   ; CW=$Cwarning        ; CF=$Cfile     ;       CH=$Cheading ; CX=$Coff

# default is to be verbose - even if we can't find config files
MDPUB_VERBOSE=TRUE
MDPUB_TITLE="md-publish by mrmxf"

#pull in the default settings & optional config
source $SCRIPT_FOLDER/_SETTINGS >/dev/null 2>&1
source $CONFIG_PATH >/dev/null 2>&1

if [ -n $MDPUB_VERBOSE ] ; then
  echo -e "${Ctxt}                >>>$Cheading $MDPUB_TITLE $Coff"
  echo -e "${Ctxt}load _SETTINGS from$Cfile $SCRIPT_FOLDER/SETTINGS $Coff"
  echo -e "${Ctxt}load    CONFIG from$Cfile $CONFIG_PATH $Coff"
  echo -e "${Ctxt}     script version$Cinfo $MDPUB_SCRIPT_VERSION $Coff"
  echo -e "${Ctxt}      output folder$Cinfo $OUTPUT_FOLDER $Coff"
  echo -e "${Ctxt}      default files$Cinfo $FILE_GLOB $Coff"
fi

# handle the init command
if [ "$1" == "init" ] ;  then
  echo -e "${Ctxt}    copy init files$Cinfo $SCRIPT_FOLDER/template-init/ $Coff"
  cp -r "$SCRIPT_FOLDER/template-init/" .
  exit 0
fi

# iterate over all yml files in the root folder and run pandoc
for f in $FILE_GLOB
do
  # reset the project config in case there is no config for this doc
  source $CONFIG_PATH >/dev/null 2>&1
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
