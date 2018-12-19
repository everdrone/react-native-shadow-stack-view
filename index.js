import React, { Component } from 'react';
import { requireNativeComponent, processColor } from 'react-native';

const WrappedShadowStackView = requireNativeComponent(
  'ShadowStackView',
  ShadowStackView
);

export default class ShadowStackView extends Component {
  render() {
    let { shadows, style, ...rest } = this.props;
    let processShadows = shadows.slice();
    for (let i in shadows) {
      processShadows[i].color = processColor(shadows[i].color);
    }
    // RCTConvert workaround
    let newShadows = {
      ss: processShadows,
    };

    let wrappedStyle = {};

    if (style && style.backgroundColor) {
      wrappedStyle.bckColor = processColor(style.backgroundColor);
    }

    const {
      borderRadius,
      borderTopLeftRadius,
      borderTopStartRadius,
      borderTopRightRadius,
      borderTopEndRadius,
      borderBottomLeftRadius,
      borderBottomStartRadius,
      borderBottomRightRadius,
      borderBottomEndRadius,

      backgroundColor,
      shadowOpacity,
      shadowRadius,
      shadowColor,
      shadowOffset,
      borderColor,
      borderWidth,
      ...reducedStyle
    } = style;

    return (
      <WrappedShadowStackView
        {...rest}
        shadows={newShadows}
        {...reducedStyle}
        {...wrappedStyle}
      />
    );
  }
}
