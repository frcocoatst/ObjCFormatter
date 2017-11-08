//
//  AppDelegate.h
//  FormatterDemo
//
//  Created by me on 05.05.14.
//  Copyright (c) 2014 fritz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *enterIP;

@property (weak) IBOutlet NSTextField *outputIP;

- (IBAction)setIPAction:(id)sender;

@end
