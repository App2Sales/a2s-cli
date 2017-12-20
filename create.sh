#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Passe a opção a ser criada [screens, containers ou components] e um nome como parâmetro!"
    exit 1
fi

if [ ! -d "App" ]; then
    echo "Diretório 'App' não encontrado. Você precisa estar na raiz do projeto!"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir App/$1/$2
cd App/$1/$2
cp $DIR/templates/template/template.js .
cp $DIR/templates/template/index.js .
cp $DIR/templates/template/styles.js .
mv template.js $2.js
sed -i "s/template/$2/g" $2.js 
sed -i "s/template/$2/g" index.js
cd ../
sed -i "1 i\import $2 from './$2';" index.js
sed -i "/\export {/a\    $2," index.js
echo "Arquivos criados com sucesso!"