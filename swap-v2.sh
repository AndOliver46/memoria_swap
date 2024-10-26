#!/bin/bash

echo "Sua memória swap total atualmente é:"
awk '/SwapTotal/ {print $2/1024/1024 " GB"}' /proc/meminfo
echo ""

echo "Seu espaço em disco atualmente é:"
df --block-size=1G / | awk 'NR==2 {print $4 " GB"}'
echo ""

echo "Desativando swap ativa!"
swapoff -a
echo ""

read -p "Insira a quantidade de memória swap desejada (em MB): " memoria
echo "Aguarde alguns instantes..."
chmod 600 /swapfile
dd if=/dev/zero of=/swapfile bs=1M count=${memoria}
mkswap /swapfile
swapon /swapfile
echo ""

echo "Memória swap alterada!"
free -h
