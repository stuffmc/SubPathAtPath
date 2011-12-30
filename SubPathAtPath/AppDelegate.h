//
//  AppDelegate.h
//  SubPathAtPath
//
//  Created by Manuel Carrasco Molina on 30.12.11.
//  Copyright (c) 2011 Pomcast. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) NSOpenPanel *openPanel;
@property (strong) NSFileManager *fm;
@property (strong) NSUserDefaults *defaults;

@end
