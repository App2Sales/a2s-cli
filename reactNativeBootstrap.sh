#!/bin/bash
# script to create a react native project structure
# alias rnbootstrap='sh ~/scripts/reactNativeBootstrap.sh $*'
if [ $# -lt 1 ]; then
   echo "Passe o nome do seu projeto como parâmetro!"
   exit 1
fi
echo "Criando projeto... Aguarde alguns instantes."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
react-native init $1 &&
cd $1 &&
echo "Criando diretórios... Isso será bem rápido."
mkdir App &&  
mkdir App/components && 
mkdir App/config && 
mkdir App/screens && 
mkdir App/containers && 
mkdir App/utils && 
mkdir App/assets && 
mkdir App/assets/img &&
mv App.js App/App.js &&
cp -R $DIR/templates/components App/components
cp -R $DIR/templates/containers App/containers
cp -R $DIR/templates/config App/config
cp -R $DIR/templates/screens App/screens
cp -R $DIR/templates/utils App/utils
cp $DIR/templates/index.js App/index.js
echo "Vamos adicionar alguns complementos? Veja a seguir o que deseja instalar."

echo "Deseja instalar o redux [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add redux react-redux redux-logger 
  mkdir App/redux
  cp $DIR/templates/redux/index.js App/redux/index.js
  echo "Deseja instalar o reduxsauce [Y/n]?"
    read p
    p=${p:-"y"}
    if [ "$p" == "y" -o "$p" == "Y" ]; then
      yarn add reduxsauce seamless-immutable
    fi
fi

echo "Deseja instalar o moment [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add moment
fi

echo "Deseja instalar o lazy.js [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add lazy.js
fi

echo "Deseja instalar o lodash [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add lodash
fi

echo "Deseja instalar o React Navigation [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add react-navigation
  cp $DIR/templates/router.js App/router.js
fi

echo "Deseja instalar o React Native Firebase [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add react-native-firebase
  react-native link react-native-firebase
  echo "Para concluir a instalação siga as instruções em: https://rnfirebase.io/docs/v3.0.*/installation/initial-setup"
fi

echo "Deseja instalar o Realm [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add realm
  react-native link realm
fi

echo "Deseja instalar o React Native Vector Icons [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add react-native-vector-icons
  react-native link react-native-vector-icons
fi

echo "Deseja adicionar ESLint no projeto? [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
yarn add --dev babel-eslint eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-native
cp $DIR/templates/.eslintrc.json .
cp $DIR/templates/.editorconfig .
fi

echo "Deseja instalar o React Native Smart Splash Screen [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add react-native-smart-splash-screen
  react-native link react-native-smart-splash-screen
  echo "Para concluir a instalação siga as instruções em: https://github.com/react-native-component/react-native-smart-splash-screen"
fi

echo "Projeto criado e configurado com sucesso! Happy Coding!"