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

+ (instancetype)itemWithIdentifier:(NSString *)identifier;

//Button Item
+ (instancetype)buttonItemWithIdentifier:(NSString *)identifier title:(nullable NSString *)title image:(nullable NSImage *)image target:(nullable id)target action:(nullable SEL)action;
+ (nullable instancetype)buttonItemWithAssociatedButton:(NSButton *)button;//!<button must be identifier specifically
+ (nullable instancetype)buttonItemWithAssociatedButton:(NSButton *)button handler:(nullable NS_NOESCAPE void (^)(NSButton * button))handler;//!<button must be identifier specifically
@property (assign, nullable) NSButton * button;//!<no null for buttonBarItem

@end

@interface NSTouchBarItem (ZMConvenience)

@property (readonly, nullable) NSButton * button;

@end

@interface NSTouchBar (ZMConvenience)

+ (instancetype)touchaBar;

@end

NS_ASSUME_NONNULL_END
