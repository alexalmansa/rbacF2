#!/bin/bash

function llegeixDirConfig()
{
    i=0
    while read -r line; do
        case "$i" in
            0)
                CONFIG="$line"
                ;;

            1)
                PORTroot="$line"
                ;;
            
            2)
                
                PORTmail="$line"
                ;;
            3)
                MAIL="$line"
                ;;

            *)
                ;;
        esac
        i=$((i+1))
    done < "$CONFIGBASE/configuracio"
}


CONFIGBASE=/users


llegeixDirConfig

while [ true ]; do



    comanda=$(netcat -l $PORTroot)
    
    #tractem els parametres rebuts

    IFS='-' read -r -a arrayParametres <<< "$comanda"
    
    user="${arrayParametres[0]}"
    funcio="${arrayParametres[1]}"
    fraseGroups="groups $user"
    grups="$($fraseGroups)"
    array=( $grups )
    rol="${array[3]}"


    #Rebo si vol crear o borrar, i nom dusuari, faig groups per saber el seu rol, i faig la comanda enviroment


    #CAL ENVIAR AL BACKGROUND AMB & AL FINAL DE LA FUNCIO

    echo "FUNCIO: $funcio"
    case $funcio in
        
        clean)
            pkill -U $user
            bash /users/config/removeEnviroment remove $user userenviroment
            bash /users/config/removeEnviroment remove $user userhome
            ;;
        reset)
            bash /users/config/removeEnviroment remove $user userenviroment
            bash /users/config/enviroment "$user" &
            ;;
        borraHomeCon)
            #Mata proces bin bash de user i fa el bash
            pkill -U $user
            bash /users/config/removeEnviroment remove $user userhome &
            ;;
        borraEntorn)
            bash /users/config/removeEnviroment remove $user userenviroment &
            ;;
        borraHome)
            bash /users/config/removeEnviroment remove $user userhome &
            ;;
    esac
    
done
