// import libraries
import React, { Component } from 'react';
import { View, Text, Image } from 'react-native';
import SplashScreen from 'react-native-smart-splash-screen';
import styles from './styles';
import { images } from '../../config';

// create a component
class HomeScreen extends Component {
    static navigationOptions = () => ({
        title: 'HomeScreen',
        tabBarIcon: ({ tintColor }) =>
            (<Image source={images.homeIcon} style={[styles.icon, { tintColor }]} />)
    });

    componentDidMount() {
        SplashScreen.close({
            animationType: SplashScreen.animationType.scale,
            duration: 850,
            delay: 500
        });
    }
    render() {
        return (
            <View style={styles.container}>
                <Text>HomeScreen</Text>
            </View>
        );
    }
}

// make this component available to the app
export default HomeScreen;
