#!/bin/bash

echo -e "\n NumberJack \n"
choice=0

while [ "$choice" -ne 3 ]; do
  echo  "
  PLAY : Hit 1 and enter.
  HELP : Hit 2 and enter.
  EXIT : Hit 3 and enter.
  "
  read -r -p "Enter your choice : " choice
  if [ "$choice" -eq 1 ];then
    x=0
    cancel=0
    points=0
    read -r -p "Enter any number between 0 and 9 : " n
      while [ "$cancel" -eq 0 ]; do
        mapfile -t r < <(shuf -i 0-9 -n 10)
        echo "${r[@]}";
        for i in {1..10}; do
          a[i]="$i"
        done
        echo "${a[@]}"
        read -r -t 5 -p "Enter the index of your number : " x

        if [[ "$?" -gt 128 ]]; then
          cancel=1
          break
        fi

        if [ "${r[$x-1]}" -eq "$n" ];then
          echo "Great"
          points=$((points+1))
        else
          cancel=1
          break
        fi
      done
  elif [ "$choice" -eq 2 ];then
    echo "HELP: INSTRUCTIONS TO PLAY THE GAME. "
  else
    break
  fi

  if [ "$cancel" -eq 1 ];then
    echo -e "\nGAME OVER\n"
    echo "You scored $points points"
  fi

done
