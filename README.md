# Script para Gerenciar Memória Swap

Este repositório contém um script em Bash que permite verificar, remover e criar uma nova memória swap em seu sistema Linux.

## Requisitos

- Sistema Linux.
- Permissões de superusuário (sudo) para modificar a memória swap.

## Uso

1. **Clone o repositório (ou baixe o arquivo diretamente se preferir):**

   ```bash
   git clone https://github.com/AndOliver46/memoria_swap.git
   cd memoria_swap
   ```

2. **Torne o script executável:**

   ```bash
   chmod +x swap.sh
   ```

3. **Execute o script:**

   ```bash
   sudo ./swap.sh
   ```

## Como o Script Funciona

- **Exibe a memória swap total:** O script começa mostrando a quantidade total de memória swap disponível atualmente.
  
- **Exibe o espaço em disco:** Ele também informa o espaço disponível em disco na partição raiz.

- **Remove swap existente:** Se uma imagem de swap chamada `swap.img` já existir, o script irá removê-la.

- **Solicita nova quantidade de swap:** O usuário é solicitado a inserir a quantidade desejada de memória swap em gigabytes.

- **Cria nova imagem de swap:** Uma nova imagem de swap é criada, configurada e ativada.

- **Atualiza o fstab:** O script adiciona uma entrada no arquivo `/etc/fstab` para que a nova swap seja montada automaticamente na inicialização.

## Atenção

- **Certifique-se de ter backup de dados importantes antes de executar scripts que alteram a configuração do sistema.**
- O valor inserido para a memória swap deve ser um número válido em GB.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para enviar um pull request ou abrir uma issue.
