//
//  NSString+foobar.m
//  testfile
//
//  Created by Greg Jaskiewicz on 05/02/2013.
//  Copyright (c) 2013 Greg Jaskiewicz. All rights reserved.
//

#import "NSString+foobar.h"

@implementation NSString (foobar)

static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789:/!@£$%^&*()_+=-\'][/.,<>?:\"|{}`~§±";

+ (NSString *)generateRandStringLength:(NSUInteger)length
{
  NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
  
  for (NSUInteger i=0; i<length; i++)
  {
    [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
  }
  
  return randomString;
}

+ (NSString *)generateUtf16RandStringLength:(NSUInteger)length
{
  NSString *s;
  do
  {
    NSMutableData   *d = [[NSMutableData alloc] initWithCapacity:length*2];
    UInt8 foo[length*2];
    
    for (NSUInteger i=0; i<length*2; i++)
    {
      foo[i] = 1+(arc4random()%(UINT8_MAX-1));
    }
    
    [d appendBytes:foo length:sizeof(foo)];
    
    s = [[NSString alloc] initWithData:d encoding:NSUTF16BigEndianStringEncoding];
  } while(!s);
  
  return s;
}

@end
