import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';

import ShadowStackView from 'react-native-shadow-stack-view';

export default class App extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Wait..</Text>
        <Text style={styles.instructions}>
          Looks like we have multiple shadows
        </Text>
        <ShadowStackView
          style={{
            width: 300,
            height: 300,
            backgroundColor: 'red',
            borderRadius: 40,
          }}
          shadows={[
            {
              color: 'blue',
              opacity: 0.5,
              radius: 12,
              offset: {
                width: 20,
                height: 30,
              },
            },
            {
              color: 'red',
              opacity: 0.5,
              radius: 12,
              offset: {
                width: 10,
                height: -30,
              },
            },
            {
              color: 'green',
              opacity: 0.5,
              radius: 12,
              offset: {
                width: -30,
                height: 12,
              },
            },
          ]}
        >
          <Text>Test SubView</Text>
        </ShadowStackView>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 35,
  },
});
