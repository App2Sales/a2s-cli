// import liraries
import React, { Component } from 'react';
import { View, Text } from 'react-native';
import styles from './style';

// create a component
class HomeScreen extends Component {
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
