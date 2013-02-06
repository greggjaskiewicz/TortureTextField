//
//  FfFfAppDelegate.m
//  testfile
//
//  Created by Greg Jaskiewicz on 05/02/2013.
//  Copyright (c) 2013 Greg Jaskiewicz. All rights reserved.
//

#import "FfFfAppDelegate.h"
#import "NSString+foobar.h"

@interface FfFfAppDelegate()

@property(strong, nonatomic) NSTextField *foo;
@property(strong) dispatch_queue_t q;

@end


@implementation FfFfAppDelegate

- (void)runRandom
{
  dispatch_sync(self.q, ^{
    NSString __block *f = [NSString generateUtf16RandStringLength:1+arc4random_uniform(63)];
    
    dispatch_async(dispatch_get_main_queue(), ^{
      self.foo.stringValue = f;
      [self.foo selectText:nil];
      [self.window makeFirstResponder:self.foo];
      [self runRandom];
    });
    
  });
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  self.q = dispatch_queue_create("foo", DISPATCH_QUEUE_SERIAL);
  self.foo = [[NSTextField alloc] init];
  [self.window makeFirstResponder:self.foo];
  [self.window setContentView:self.foo];
  
  [self.foo selectText:nil];
  [self.window makeFirstResponder:self.foo];

  [self runRandom];
}

@end
