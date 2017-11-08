//
//  AppDelegate.m
//  FormatterDemo
//
//  Created by me on 05.05.14.
//  Copyright (c) 2014 fritz. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   // Insert code here to initialize your application
}

- (IBAction)setIPAction:(id)sender
{
   [_outputIP setStringValue:[_enterIP stringValue ]];
}
@end
