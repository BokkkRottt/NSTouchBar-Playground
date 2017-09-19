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

@interface NSTouchBarItem (PrivateAPI)

+ (void)addSystemTrayItem:(NSTouchBarItem *)item;//!<private API
+ (void)removeSystemTrayItem:(NSTouchBarItem *)item;//!<private API

@end

@interface NSTouchBar (PrivateAPI)

+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar systemTrayItemIdentifier:(NSString *)identifier;//!<private API
+ (void)dismissSystemModalFunctionBar:(NSTouchBar *)touchBar;//!<private API

@end
