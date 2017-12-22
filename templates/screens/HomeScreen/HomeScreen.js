// import liraries
import React, { Component } from 'react';
import { View, Text } from 'react-native';
import SplashScreen from 'react-native-smart-splash-screen';
import styles from './style';

// create a component
class HomeScreen extends Component {
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
