//
//  NSTouchBar+BRPrivate.h
//  NSTouchBar Playground
//
//  Created by Yang on 12/07/2017.
//  Copyright © 2017 Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern void DFRElementSetControlStripPresenceForIdentifier(NSString *, BOOL);
extern void DFRSystemModalShowsCloseBoxWhenFrontMost(BOOL);

@interface NSTouchBarItem (BRPrivate)

+ (void)addSystemTrayItem:(NSTouchBarItem *)item;

@end

@interface NSTouchBar (BRPrivate)

+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar systemTrayItemIdentifier:(NSString *)identifier;

@end
