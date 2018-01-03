#!/bin/bash
# script to create a react native project structure

if [ $# -lt 1 ]; then
   echo "Passe o nome do seu projeto como parâmetro!"
   exit 1
fi

# Predefinindo complementos
echo "Antes de criar seu projeto, faremos algumas perguntas."
echo ""
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT=$1
project=${PROJECT,,}
adds=""
echo "Veja a seguir quais complementos deseja instalar."
echo ""

# REDUX
echo "Deseja instalar o redux [Y/n]?"
read redux
redux=${redux:-"y"}
if [ "$redux" == "y" -o "$redux" == "Y" ]; then
  adds="${adds} redux react-redux redux-logger"

  # REDUX SAUCE  
  echo "Deseja instalar o reduxsauce [Y/n]?"
    read reduxSauce
    reduxSauce=${reduxSauce:-"y"}
    if [ "$reduxSauce" == "y" -o "$reduxSauce" == "Y" ]; then
      adds="${adds} reduxsauce seamless-immutable"
    fi
fi

# MOMENT
echo "Deseja instalar o moment [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} moment"
fi

# LAZY
echo "Deseja instalar o lazy.js [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} lazy.js"
fi

# LODASH
echo "Deseja instalar o lodash [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} lodash"
fi

# FIREBASE
echo "Deseja instalar o React Native Firebase [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} react-native-firebase"
  echo "Para concluir a instalação siga as instruções em: https://rnfirebase.io/docs/v3.0.*/installation/initial-setup"
fi

# REALM
echo "Deseja instalar o Realm [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} realm"
fi

# VECTOR ICONS
echo "Deseja instalar o React Native Vector Icons [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} react-native-vector-icons"
fi

# KEYBOARD AWARE SCROLLVIEW
echo "Deseja instalar o React Native Keyboard Aware ScrollView [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} react-native-keyboard-aware-scroll-view"
fi

# KEYBOARD AWARE SCROLLVIEW
echo "Deseja instalar o Validator JS [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} validator"
fi

# FASTLANE
echo "Deseja configurar FastLane para esse projeto [Y/n]?"
read fastlane
fastlane=${fastlane:-"y"}

# Animação do café
echo "-------------------------------------------------------------------"
echo -en "Instalação iniciada, pode ir buscar um ☕ enquando espera... [_ ]P" "\r"
sleep 0.5
echo -en "Instalação iniciada, pode ir buscar um ☕ enquando espera... [■ ]P" "\r"
sleep 0.5
echo -en "Instalação iniciada, pode ir buscar um ☕ enquando espera... [_ ]P" "\r"
sleep 0.5
echo -en "Instalação iniciada, pode ir buscar um ☕ enquando espera... [■ ]P" "\r"
sleep 0.5
echo -en "Instalação iniciada, pode ir buscar um ☕ enquando espera... [_ ]P" "\r"
sleep 0.5
echo -en "Instalação iniciada, pode ir buscar um ☕ enquando espera... [■ ]P" "\r"
sleep 0.5
echo -en "Instalação iniciada, pode ir buscar um ☕ enquando espera... [_ ]P" "\r"
sleep 0.5
echo "Instalação iniciada, pode ir buscar um ☕ enquando espera... [■ ]P"
sleep 1

# Criando o projeto
react-native init $PROJECT

# Criando estrutura da pasta de projeto e copiando arquivos do template
cd $PROJECT
sed -i "/\"scripts\": {/a\    \"postinstall\": \"rm -rf .git/hooks/pre-push && node node_modules/husky/bin/install.js && rm -rf .git/hooks/pre-commit\"," package.json
sed -i "/\"scripts\": {/a\    \"prepush\": \"yarn run lint\"," package.json
sed -i "/\"scripts\": {/a\    \"lint\": \"eslint App/\"," package.json
echo "Criando diretórios... Isso será bem rápido."
mkdir App
mkdir App/components 
mkdir App/config 
mkdir App/screens 
mkdir App/containers 
mkdir App/utils 
mkdir App/assets
mkdir App/assets/img
rm App.js
cp $DIR/templates/App.js App/App.js
cp -R $DIR/templates/components App
cp -R $DIR/templates/containers App
cp -R $DIR/templates/config App
cp -R $DIR/templates/screens App
cp -R $DIR/templates/utils App
cp -R $DIR/templates/assets App
cp $DIR/templates/index.js App/index.js
cp $DIR/templates/router.js App/router.js
cp $DIR/templates/.eslintrc.json .
cp $DIR/templates/.editorconfig .


# Copiando arquivos condicionais, baseados nas opções coletadas anteriormente
if [ "$fastlane" == "y" -o "$fastlane" == "Y" ]; then
  # Copy Fastlane files from Android and iOS
  cp -R $DIR/templates/fastlane/android/fastlane android
  cp -R $DIR/templates/fastlane/android/android-licenses android
  cp -R $DIR/templates/fastlane/ios/fastlane ios
  # Rename bundle name on files
  sed -i "s/template/$project/g" android/fastlane/Appfile
  sed -i "s/template/$project/g" ios/fastlane/Appfile
  sed -i "s/template/$project/g" ios/fastlane/Deliverfile
  sed -i "s/template/$project/g" ios/fastlane/Fastfile
  sed -i "s/template/$project/g" ios/fastlane/Matchfile
  echo "Não se esqueça de remover o comentário no scheme do FastFile do iOS. ;)"
fi


if [ "$redux" == "y" -o "$redux" == "Y" ]; then  
  mkdir App/redux
  cp $DIR/templates/redux/index.js App/redux/index.js  
fi

# Instalando pacotes adicionais
adds="${adds} react-native-global-props react-native-smart-splash-screen react-navigation"
yarn add --dev babel-eslint eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-native husky
yarn add $adds

# Configurando arquivos de SplashScreen
cp -R $DIR/templates/res android/app/src/main
onCreate="\ @Override\n\tprotected void onCreate(Bundle savedInstanceState) {\n\t\tRCTSplashScreen.openSplashScreen(this);   //open splashscreen\n\t\tsuper.onCreate(savedInstanceState);\n\t}"
sed -i "/package com.${project};/aimport android.os.Bundle;\nimport com.reactnativecomponent.splashscreen.RCTSplashScreen;" android/app/src/main/java/com/$project/MainActivity.java
sed -i "/public class MainActivity extends ReactActivity {/a${onCreate}" android/app/src/main/java/com/$project/MainActivity.java
sed -i "/<\/style>/i\   <item name=\"android:windowIsTranslucent\">true</item>" android/app/src/main/res/values/styles.xml

# Linkando pacotes adicionais
react-native link

# Iniciando git
git init

echo "Projeto criado e configurado com sucesso! Happy Coding!"