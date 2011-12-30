//
//  AppDelegate.m
//  SubPathAtPath
//
//  Created by Manuel Carrasco Molina on 30.12.11.
//  Copyright (c) 2011 Pomcast. All rights reserved.
//

#import "AppDelegate.h"

#define PATH @"path"

@implementation AppDelegate

@synthesize window = _window;
@synthesize openPanel = _openPanel;
@synthesize fm = _fm;
@synthesize defaults = _defaults;

- (void)subpaths:(NSString*)path
{
    NSLog(@"path: %@", path);
    NSLog(@"subpaths: %@", [self.fm subpathsAtPath:path]);

    // The following allows to reproduce the code -- test purpose
    [self performSelector:@selector(open) withObject:nil afterDelay:2];
}

- (void)open 
{
    [self.openPanel beginSheetModalForWindow:[self window]
                      completionHandler:^(NSInteger returnCode) {
                          if (returnCode) {
                              NSString *path = [[self.openPanel URL] path];
                              [self.defaults setObject:path forKey:PATH];
                              [self subpaths:path];
                          }
                      }];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.defaults = [NSUserDefaults standardUserDefaults];
    self.openPanel = [NSOpenPanel openPanel];
    self.openPanel.canChooseDirectories = YES;
    self.fm = [NSFileManager defaultManager];
    NSString *path = [self.defaults valueForKey:PATH];
    
    // This first call to "-[self subpath:]" 
    // (obviously given *path could find something, that is, the app was run once) 
    // works without sandboxing but not under sandboxing
    //
    // I'm a little bit confused since I'm using com.apple.security.files.user-selected.read-only
    // 
    
    [self subpaths:path];
}

@end
