//
//  NSCustomTouchBarItem+BRConvenience.m
//  NSTouchBar Playground
//
//  Created by Yang on 06/07/2017.
//  Copyright © 2017 Yang. All rights reserved.
//

#import "NSCustomTouchBarItem+BRConvenience.h"

NSString * NSNullPlaceholderString(NSString * aString, NSString * placeHolder) {
    if (!aString) {
        return placeHolder;
    }
    return aString;
}

NSString * BRRandomIdentifier() {
    return [NSUUID UUID].UUIDString;
}

@implementation NSImage (BRConvenience)

- (NSImage *)templatedImage
{
    self.template = YES;
    return self;
}

@end

@implementation NSTouchBar (ZMConvenience)

+ (instancetype)touchaBar
{
    return [[self alloc] init];
}

@end

@implementation NSTouchBarItem (ZMConvenience)

- (NSButton *)button
{
    if ([self.view isKindOfClass:[NSButton class]]) {
        return (NSButton *)self.view;
    }
    return nil;
}

@end

@implementation NSCustomTouchBarItem (BRConvenience)

+ (instancetype)itemWithIdentifier:(NSString *)identifier
{
    return [[NSCustomTouchBarItem alloc] initWithIdentifier:identifier];
}

+ (instancetype)buttonItemWithIdentifier:(NSString *)identifier title:(nullable NSString *)title image:(nullable NSImage *)image target:(nullable id)target action:(nullable SEL)action
{
    NSCustomTouchBarItem * newItem = [self itemWithIdentifier:identifier];
    NSButton * buttonView = nil;
    if (title.length && image) {
        buttonView = [NSButton buttonWithTitle:title image:image.templatedImage target:target action:action];
    }
    else if (image) {
        buttonView = [NSButton buttonWithImage:image.templatedImage target:target action:action];
    }
    else {
        buttonView = [NSButton buttonWithTitle:NSNullPlaceholderString(title, @"Button") target:target action:action];
    }
    
    newItem.view = buttonView;
    return newItem;
}

+ (nullable instancetype)buttonItemWithAssociatedButton:(NSButton *)button
{
    return [self buttonItemWithAssociatedButton:button handler:nil];
}

+ (nullable instancetype)buttonItemWithAssociatedButton:(NSButton *)button handler:(nullable NS_NOESCAPE void (^)(NSButton * button))handler
{
    if (!button.identifier.length || button.hidden || !button.superview) {
        return nil;
    }
    NSCustomTouchBarItem * newItem = [self itemWithIdentifier:button.identifier];
    NSButton * buttonView = nil;
    if (button.title.length && button.image) {
        buttonView = [NSButton buttonWithTitle:button.title image:button.image.templatedImage target:button.target action:button.action];
    }
    else if (button.image) {
        buttonView = [NSButton buttonWithImage:button.image.templatedImage target:button.target action:button.action];
    }
    else {
        buttonView = [NSButton buttonWithTitle:NSNullPlaceholderString(button.title, @"Button") target:button.target action:button.action];
    }
    newItem.view = buttonView;
    if ([button.keyEquivalent isEqualToString:@"\r"]) {
        buttonView.keyEquivalent = @"\r";
    }
    newItem.view.identifier = button.identifier;
    buttonView.enabled = button.enabled;
    
    if (handler) {
        handler(buttonView);
    }
    
    return newItem;
}

- (void)setButton:(NSButton *)button
{
    if ([button isKindOfClass:[NSButton class]]) {
        self.view = button;
    }
}

@end
