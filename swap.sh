#!/bin/bash

echo "Sua memória swap total atualmente é:"
awk '/SwapTotal/ {print $2/1024/1024 " GB"}' /proc/meminfo

echo "Seu espaço em disco atualmente é:"
df --block-size=1G / | awk 'NR==2 {print $4 " GB"}'

if swapon --show | grep -q '/swap.img'; then
    echo "Removendo swap existente..."
    swapoff /swap.img
    rm /swap.img
    echo "Swap removido."
fi

read -p "Insira a quantidade de memória swap desejada (em GB): " memoria

fallocate -l ${memoria}G /swap.img

chmod 600 /swap.img
mkswap /swap.img
swapon /swap.img
echo '/swap.img none swap sw 0 0' | sudo tee -a /etc/fstab

echo "Memória swap alterada!"
swapon --show
