

# **********************************************************
#           USER PERMISSIONS
# **********************************************************

# Exit if not root or a sudoer
{ [[ $(id -u) -eq 0 ]] || $(sudo -v &>/dev/null) ; } || { echo -e "Please run with sudo privileges.\nExiting..." ; exit 1 ; } 


# **********************************************************
#           FILE MANIPULATION
# **********************************************************
# Rename files (Add '.sh' extension)
find . -maxdepth 1 -type f -exec mv '{}' '{}.sh' \;




# **********************************************************
#           NUMBERS AND ARITHMETIC
# **********************************************************

# Determine numeric parity (even/odd)
even_or_odd()
{
    integertest='^[0-9]+$'
    [[ ! $1 =~ $integertest ]] && echo "Not an integer!" && return 1
    [[ $(( $1 % 2 )) == 0 ]] && echo "Even" || echo "Odd"
}



# **********************************************************
#           PRINTING AND FORMATTING
# **********************************************************

# Get count of characters wide the terminal is
COLUMNS=$(tput cols)

prHeader(){

    for each in $(seq 1 $COLUMNS)

    do

    echo -n $1

    done

}

prtxtCentre(){

title=$1

printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"

}



# print colored text
print_colored()
{

    [[ -z "$1" ||  -z "$2" ]] && echo "Usage: print_colored <color> <text>" && exit 1

    case "$2" in
        "grey" | "GREY")        echo -e "\033[90m$2 \033[00m" ;;
        "red" | "RED")          echo -e "\033[91m$2 \033[00m" ;;
        "green" | "GREEN")      echo -e "\033[92m$2 \033[00m" ;;
        "yellow" | "YELLOW")    echo -e "\033[93m$2 \033[00m" ;;
        "blue" | "BLUE")        echo -e "\033[94m$2 \033[00m" ;;
        "purple" | "PURPLE")    echo -e "\033[95m$2 \033[00m" ;;
        "cyan" | "CYAN")        echo -e "\033[96m$2 \033[00m" ;;
        "white" | "WHITE")      echo -e "\033[96m$2 \033[00m" ;;
        *   )               echo -e "\033[96m$2 \033[00m" ;;
    esac


}
