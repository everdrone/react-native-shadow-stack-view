# react-native-shadow-stack-view

## Getting started

```bash
yarn add react-native-shadow-stack-view --save
```

### Mostly automatic installation

```bash
react-native link react-native-shadow-stack-view
```

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` > `Add Files to [your project's name]`
2. Go to `node_modules` > `react-native-shadow-stack-view` and add `RNShadowStackView.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNShadowStackView.a` to your project's `Build Phases` > `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

## Usage

```javascript
<ShadowStackView
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
  ]}
>
  ...
</ShadowStackView>
```

## Props

- `shadows`
  `array`: A list of [Shadow Props](https://facebook.github.io/react-native/docs/shadow-props) objects

## Caveats

If XCode gives you a linker error and many warnings like `Auto-Linking library not found for -lswiftCoreGraphics` just add an empty swift file to the root of your `.xcodeproj` ([Source](https://stackoverflow.com/questions/50096025/it-gives-errors-when-using-swift-static-library-with-objective-c-project/50495316#50495316))
