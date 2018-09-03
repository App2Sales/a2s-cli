// import libraries
import React from 'react';
import { View, Text } from 'react-native';
import styles from './styles';

// create a dumb component
const template = props => (
    <View style={styles.container}>
        <Text>{props}</Text>
    </View>
);

// make this component available to the app
export default template;
