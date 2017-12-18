import { StackNavigator, TabNavigator, TabBarTop } from 'react-navigation';
import {
    HomeScreen
} from './screens';
import { colors } from './config';

const MainTabNavigator = TabNavigator(
    {
        // place yours tabs here
        // sample: 
        HOME: { screen: HomeScreen }
    },
    {
        tabBarComponent: TabBarTop,
        tabBarPosition: 'bottom',
        tabBarOptions: {
            showIcon: true,
            showLabel: true,
            activeTintColor: colors.activeColor, // TODO: change to correct color
            inactiveTintColor: colors.inactiveColor, // TODO: change to correct color
            upperCaseLabel: false,
            tabStyle: {
                elevation: 10
            },
            labelStyle: {
                width: '100%',
                fontSize: 10
            },
            style: {
                backgroundColor: colors.tabBackground, // TODO: change to correct color
                borderTopWidth: 1,
                borderTopColor: colors.tabBorderColor
            },
            indicatorStyle: {
                borderColor: colors.activeColor, // TODO: change to correct color
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
