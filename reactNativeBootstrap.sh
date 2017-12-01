#!/bin/bash
# script to create a react native project structure
# alias rnbootstrap='sh ~/scripts/reactNativeBootstrap.sh $*'

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
echo "export default App;" >> App/index.js;