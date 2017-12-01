#!/bin/bash
# script to create a react native project structure
# alias rnbootstrap='sh ~/scripts/reactNativeBootstrap.sh $*'
if [ $# -lt 1 ]; then
   echo "Passe o nome do seu projeto como parâmetro!"
   exit 1
fi
react-native init $1 &&
cd $1 &&
mkdir App &&  
mkdir App/components && 
mkdir App/config && 
mkdir App/screens && 
mkdir App/containers && 
mkdir App/utils && 
mkdir App/assets && 
mkdir App/assets/img &&
mv App.js app &&
echo "import App from './App';" > App/index.js &&
echo  >> App/index.js;
echo "export default App;" >> App/index.js;
echo "Deseja instalar o redux (y para continuar)?"
read p
if [ "$p" == "y" ]; then
  yarn add redux react-redux redux-logger 
  echo "Deseja instalar o reduxsauce (y para continuar)?"
    read p
    if [ "$p" == "y" ]; then
      yarn add reduxsauce seamless-immutable
    fi
fi

echo "Deseja instalar o moment (y para continuar)?"
read p
if [ "$p" == "y" ]; then
  yarn add moment
fi

echo "Deseja instalar o lodash (y para continuar)?"
read p
if [ "$p" == "y" ]; then
  yarn add lodash
fi

echo "Deseja instalar o React Navigation (y para continuar)?"
read p
if [ "$p" == "y" ]; then
  yarn add react-navigation
fi

echo "Deseja instalar o React Native Firebase (y para continuar)?"
read p
if [ "$p" == "y" ]; then
  yarn add react-native-firebase
  react-native link react-native-firebase
  echo "Para concluir a instalação siga as instruções em: https://rnfirebase.io/docs/v3.0.*/installation/initial-setup"
fi

echo "Deseja instalar o Realm (y para continuar)?"
read p
if [ "$p" == "y" ]; then
  yarn add realm
  react-native link realm
  echo "Para concluir a instalação siga as instruções em: https://rnfirebase.io/docs/v3.0.*/installation/initial-setup"
fi
