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
echo "Deseja instalar o redux [Y/n]?"

echo "const images = {" > App/config/images.js
echo "// place yours custons images here" >> App/config/images.js
echo "};" >> App/config/images.js
echo  >> App/config/images.js
echo "export default images;" >> App/config/images.js

echo "const colors = {" > App/config/colors.js
echo "// place yours custons colors here" >> App/config/colors.js
echo "};" >> App/config/colors.js
echo  >> App/config/colors.js
echo "export default colors;" >> App/config/colors.js

echo "import images from './images';" > App/config/index.js
echo "import colors from './colors';" >> App/config/index.js
echo  >> App/config/index.js
echo "export { images, colors };" >> App/config/index.js

echo "// import yours components here" > App/components/index.js
echo  >> App/components/index.js
echo "export {" >> App/components/index.js
echo "// place yours components here" >> App/components/index.js
echo " };" >> App/components/index.js

echo "// import yours screens here" > App/screens/index.js
echo  >> App/screens/index.js
echo "export {" >> App/screens/index.js
echo "// place yours screens here" >> App/screens/index.js
echo " };" >> App/screens/index.js

echo "// import yours containers here" > App/containers/index.js
echo  >> App/containers/index.js
echo "export {" >> App/containers/index.js
echo "// place yours containers here" >> App/containers/index.js
echo " };" >> App/containers/index.js

echo "// import yours utils here" > App/utils/index.js
echo  >> App/utils/index.js
echo "export {" >> App/utils/index.js
echo "// place yours utils here" >> App/utils/index.js
echo " };" >> App/utils/index.js

read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add redux react-redux redux-logger 
  mkdir App/redux
  echo "import { combineReducers } from 'redux';" > App/redux/index.js
  echo  >> App/redux/index.js
  echo "export default combineReducers({" >> App/redux/index.js
  echo "// place yours reducers here" >> App/redux/index.js
  echo " });" >> App/redux/index.js
  echo  >> App/redux/index.js
  echo "export {" >> App/redux/index.js
  echo "// place yours actions here" >> App/redux/index.js
  echo " };" >> App/redux/index.js

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
  echo "import { StackNavigator, TabNavigator, TabBarTop } from 'react-navigation';" > App/router.js
  echo "import {" >> App/router.js
  echo "// import yours screens" >> App/router.js
  echo "} from './screens';" >> App/router.js
  echo >> App/router.js
  echo "const MainTabNavigator = TabNavigator(" >> App/router.js
  echo "  {" >> App/router.js
  echo "// place yours tabs here" >> App/router.js
  echo "// sample: " >> App/router.js
  echo "// HOME: { screen:HomeScreen }" >> App/router.js
  echo "  }," >> App/router.js
  echo "  {" >> App/router.js
  echo "    tabBarComponent: TabBarTop," >> App/router.js
  echo "    tabBarPosition: 'bottom'," >> App/router.js
  echo "    tabBarOptions: {" >> App/router.js
  echo "      showIcon: true," >> App/router.js
  echo "      showLabel: true," >> App/router.js
  echo "      activeTintColor: '#FFCC29', // TODO: change to correct color" >> App/router.js
  echo "      inactiveTintColor: '#A7A7A7', // TODO: change to correct color" >> App/router.js
  echo "      upperCaseLabel: false," >> App/router.js
  echo "      tabStyle: {" >> App/router.js
  echo "        elevation: 10" >> App/router.js
  echo "      }," >> App/router.js
  echo "      labelStyle: {" >> App/router.js
  echo "        width: '100%'," >> App/router.js
  echo "        fontSize: 10" >> App/router.js
  echo "      }," >> App/router.js
  echo "      style: {" >> App/router.js
  echo "        backgroundColor: '#222222', // TODO: change to correct color" >> App/router.js
  echo "        borderTopWidth: 1," >> App/router.js
  echo "        borderTopColor: '#00000011'" >> App/router.js
  echo "      }," >> App/router.js
  echo "      indicatorStyle: {" >> App/router.js
  echo "        borderColor: '#FFCC29', // TODO: change to correct color" >> App/router.js
  echo "        borderWidth: 2," >> App/router.js
  echo "        top: 0," >> App/router.js
  echo "        position: 'absolute'" >> App/router.js
  echo "      }" >> App/router.js
  echo "    }" >> App/router.js
  echo "  }" >> App/router.js
  echo ");" >> App/router.js
  echo  >> App/router.js
  echo "const Router = StackNavigator({" >> App/router.js
  echo "  TABS: { screen: MainTabNavigator }" >> App/router.js
  echo "});" >> App/router.js
  echo  >> App/router.js
  echo "export default Router;" >> App/router.js

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