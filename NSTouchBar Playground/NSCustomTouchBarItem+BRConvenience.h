//
//  NSCustomTouchBarItem+BRConvenience.h
//  NSTouchBar Playground
//
//  Created by Yang on 06/07/2017.
//  Copyright © 2017 Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NSString * BRRandomIdentifier();//!< a random string

@interface NSCustomTouchBarItem (BRConvenience)

/**
 @note button must be identifier specifically
 */
+ (nullable instancetype)buttonItemWithButton:(NSButton *)button;
+ (nullable instancetype)buttonItemWithButton:(NSButton *)button handler:(nullable NS_NOESCAPE void (^)(NSButton * button))handler;
@property (readonly, nullable) NSButton * button;//!<no null for buttonBarItem

@end

NS_ASSUME_NONNULL_END
