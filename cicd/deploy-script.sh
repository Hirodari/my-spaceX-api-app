# /usr/bin/env bash

check_command () {
    echo $*
    if $* &> /dev/null; then 
        echo "success"
    else
       echo "failed"
    fi
}

check_command eksctl delete cluster spacez

# if eksctl delete cluster spacez; then 
#     echo "successful"
# else
#     echo "failed"
# fi