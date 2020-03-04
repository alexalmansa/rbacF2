# rbacF2
Role based user acces for Ubuntu OS. Different privileges for different roles, implemented with Docker containers and Google 2FA. All implemented using Linux shell scripts.

Instruccions

To make the devian package run dpkg-buildpackage -b -rfakeroot -us -uc from inside the rbac-0.2 folder then sudo aot install ./<Nom del .deb>

lib modules no copiar-lo per tal de que els .tar i les imatges no ocupin tant, també podriem mirar de treure altres llibreries innecesaries

CREAR LA DOCKER IMAGE:
sudo tar -c . | sudo docker import - medium

Crear un fitxer executable a bin i substituir al fitxer etc/passwd per el nostre fitxer que conté aquesta línia
Afegir disc dur desde vmware/virtualbox. Iniciem la maquina virtual i fem: a) fdisk /dev/sdb b) Fem "n", "p", enter, enter, last. Ara "w" per escriure els canvis. c) Executem: "mkfs -t ext3 /dev/sdb1","mkfs.ext3 /dev/sdb1", "mke2fs -j /dev/sdb1" d) Editem el fitxer "/etc/fstab" i posem: "/dev/sdb1 /usersext3 defaults 2 1" e) Reiniciem la maquina virtual
