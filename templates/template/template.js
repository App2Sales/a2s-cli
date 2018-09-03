// import libraries
import React, { Component } from 'react';
import { View, Text } from 'react-native';
import styles from './styles';

// create a component
class template extends Component {
    constructor(props) {
        super(props);
        this.state = {

        };
    }

    render() {
        return (
            <View style={styles.container}>
                <Text>template</Text>
            </View>
        );
    }
}

// make this component available to the app
export default template;
