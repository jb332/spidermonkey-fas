# spidermonkey-fas

Instructions to download the source code of SpiderMonkey and update it with the work in progress for this project.

curl https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py -O
python3 bootstrap.py --application-choice js --no-interactive
cp -R mozilla-unified-diff/* mozilla-unified
cd mozilla-unified
hg add *


Dans "mozilla-unified-diff" il y a le diff du code ajouté et supprimé.
Le script ci-dessus permet de télécharger spidermonkey et d'appliquer le diff.
Si ça ne marche pas, il faut peut-être prendre une ancienne version.
Je l'ai téléchargé la dernière fois le 24 juillet.

Dans "notes" et "tools" il y a des fichiers potentiellement utiles, mais c'est désorganisé.
Dans "jitbull" il y a le fichier "jit_save.zip" qui est une archive du second projet sur lequel celui-ci est basé : "jitbull". Elle contient les notes et les diff du code.

Ce projet se situe dans "/home/jb/Documents/research/projects/fas/spidermonkey_fas_project_with_instructions/spidermonkey-fas"

PS : Concernant HERE, le premier projet, je crois que l'archive d'OS à déployer sur g5k pour le faire fonctionner (deux machines à utiliser) est dans "/home/jb/Documents/archives/jb/g5k" et s'appelle "linux-5.4.12.xk.tar".
