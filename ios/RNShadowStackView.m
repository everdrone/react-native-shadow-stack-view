//
//  ShadowStack.m
//  shadowstack
//
//  Created by Giorgio on 29/10/2018.
//

#import "React/RCTViewManager.h"
#import "UIKit/UIKit.h"
#import "Foundation/Foundation.h"
#import "RNShadowStackView.h"

@interface RCT_EXTERN_MODULE(ShadowStackViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(shadows, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(bckColor, NSNumber)

@end
