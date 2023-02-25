#!/bin/bash

<< coment
Script para automatização de criação de usuários,grupos e permissões
Exercício do Bootcamp Linux da DIO.
coment


echo "########################################"
echo "####      CRIANDO DIRETORIOS       #####"
echo -e "########################################\n"

mkdir /publico
echo "Diretório /publico ...OK!"

mkdir /adm
echo "Diretório /adm ... OK!"

mkdir /ven
echo "Diretório /ven ... OK!"

mkdir /sec
echo -e "Diretório /sec ... OK\n"



echo "########################################"
echo "####         CRIANDO GRUPOS        #####"
echo -e "########################################\n"

groupadd GRP_ADM
echo "Grupo GRP_ADM ... OK!"

groupadd GRP_VEN
echo "Grupo GRP_VEN ... OK!"

groupadd GRP_SEC
echo -e "Grupo GRP_SEC ... OK!\n"



echo "########################################"
echo "####       CRIANDO USUARIOS        #####"
echo -e "########################################\n"

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_ADM

echo "Usuários carlos, maria, joao ... OK!"
echo -e "Usuários adicionados ao grupo GRP_ADM ... OK!\n"


useradd debora -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_VEN

echo "Usuários debora, sebastiana, roberto ... OK!"
echo -e "Usuários adicionados ao grupo GRP_VEN ... OK!\n"


useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt pw123) -G GRP_SEC

echo "Usuários josefina, amanda, rogerio ... OK"
echo -e "Usuários adicionados ao grupo GRP_SEC ... OK!\n"
 
 
 
echo "########################################"
echo "####      ATRIBUINDO PERMISSOES     ####"
echo -e "########################################\n"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chown root:nogroup /publico

echo "Dono:Grupo atribuídos nos diretórios ... OK!"


chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo -e "Permissões de acesso atribuídas nos diretórios ... OK!\n"


echo ".... Processo Finalizado!"
