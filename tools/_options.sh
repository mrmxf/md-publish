## mdpub UX options script
## (C) MrMXF 2020
##
## issues https://github.com/mrmxf/md-publish/issues
##
##
# this module parses the input options listed in the case statement below.
# options can appear anywhere and options with parameters are supported.
#
# Params will hold all the positional parameters
#  e.g. cmd -c --verbose file1 files
#       -c will set the variable CUBIC to 1
#       --verbose will set the varioable VERBOSE to 1
PARAMS=""
QUIET=""
ACTION="build"

#iterate over parameters & commands on the command line
while [ $# -gt 0 ] ; do
  case "$1" in
    -h|--help|help)
      QUIET="quiet"
      ACTION="help"
      shift
      ;;
    -i|--init|init)
      ACTION="init"
      shift
      ;;
    -q|--quiet)
      QUIET="quiet"
      shift
      ;;
    -u|--update|update)
      ACTION="update"
      shift
      ;;
    # -b|--my-flag-with-argument)
    #   if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
    #     MY_FLAG_ARG=$2
    #     shift 2
    #   else
    #     echo "Error: Argument for parameter $1 is missing" >&2
    #     exit 1
    #   fi
    #   ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

# set positional arguments in their proper place
eval set -- "$PARAMS"
