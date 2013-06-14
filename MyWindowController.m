//
//  MyWindowController.m
//  Logstalgia Wrapper
//
//  Created by Hamilton Turner on 10/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MyWindowController.h"


@implementation MyWindowController

- (void)awakeFromNib
{
	NSOpenPanel * panel = [NSOpenPanel openPanel];
	NSInteger result = [panel runModalForTypes: [NSArray arrayWithObject: @"log"]];
	
	if (result == NSOKButton){
		NSString * filename = [[panel filenames] lastObject];
		
		NSString * logstalgiaPath = [[NSBundle mainBundle] pathForResource:@"logstalgia" ofType:@""];
		
		NSTask * t = [[NSTask alloc] init];
		[t setArguments: [NSArray arrayWithObject: filename]];
		[t setCurrentDirectoryPath: [logstalgiaPath stringByDeletingLastPathComponent]];
		[t setLaunchPath: logstalgiaPath];
		[t launch];
		[t waitUntilExit];
		NSLog(@"%d", [t terminationStatus]);
		[t release];
		[[NSApplication sharedApplication] terminate: self];
	} else {
		[[NSApplication sharedApplication] terminate: self];
	}
}

@end
