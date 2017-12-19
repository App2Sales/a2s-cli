#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Passe o nome da sua screen como parâmetro!"
    exit 1
fi

if [ ! -d "App" ]; then
    echo "Diretório 'App' não encontrado. Você precisa estar na raiz do projeto!"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir App/screens/$* 
cd App/screens/$* 
cp $DIR/screenTemplate.js ../$*
cp $DIR/index.js ../$*
cp $DIR/styles.js ../$*
mv screenTemplate.js $*.js
sed -i "s/screenTemplate/$*/g" $*.js 
sed -i "s/screenTemplate/$*/g" index.js
cd ../
sed -i "1 i\import $* from './$*';" index.js
sed -i "/\export {/a\    $*," index.js
echo "Screen criada com sucesso!"