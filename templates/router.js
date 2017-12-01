import { StackNavigator, TabNavigator, TabBarTop } from 'react-navigation';
import {
  // import yours screens
} from './screens';

const MainTabNavigator = TabNavigator(
  {
    // place yours tabs here
    // sample: 
    // HOME: { screen:HomeScreen }
  },
  {
    tabBarComponent: TabBarTop,
    tabBarPosition: 'bottom',
    tabBarOptions: {
      showIcon: true,
      showLabel: true,
      activeTintColor: '#FFCC29', // TODO: change to correct color
      inactiveTintColor: '#A7A7A7', // TODO: change to correct color
      upperCaseLabel: false,
      tabStyle: {
        elevation: 10
      },
      labelStyle: {
        width: '100%',
        fontSize: 10
      },
      style: {
        backgroundColor: '#222222', // TODO: change to correct color
        borderTopWidth: 1,
        borderTopColor: '#00000011'
      },
      indicatorStyle: {
        borderColor: '#FFCC29', // TODO: change to correct color
        borderWidth: 2,
        top: 0,
        position: 'absolute'
      }
    }
  }
);

const Router = StackNavigator({
  TABS: { screen: MainTabNavigator }
});

export default Router;
