// import liraries
import React, { Component } from 'react';
import { View, Text } from 'react-native';
import styles from './styles';

// create a component
class screenTemplate extends Component {
    render() {
        return (
            <View style={styles.container}>
                <Text>screenTemplate</Text>
            </View>
        );
    }
}

// make this component available to the app
export default screenTemplate;
