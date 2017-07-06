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

@implementation NSCustomTouchBarItem (BRConvenience)

+ (nullable instancetype)buttonItemWithButton:(NSButton *)button
{
    return [self buttonItemWithButton:button handler:nil];
}

+ (nullable instancetype)buttonItemWithButton:(NSButton *)button handler:(nullable NS_NOESCAPE void (^)(NSButton * button))handler
{
    if (!button.identifier.length || button.hidden || !button.superview) {
        return nil;
    }
    NSCustomTouchBarItem * newItem = [[NSCustomTouchBarItem alloc] initWithIdentifier:button.identifier];
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

- (NSButton *)button
{
    if ([self.view isKindOfClass:[NSButton class]]) {
        return (NSButton *)self.view;
    }
    return nil;
}

@end
