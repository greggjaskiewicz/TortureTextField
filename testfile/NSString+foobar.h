//
//  NSString+foobar.h
//  testfile
//
//  Created by Greg Jaskiewicz on 05/02/2013.
//  Copyright (c) 2013 Greg Jaskiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (foobar)

+ (NSString *)generateRandStringLength:(NSUInteger)length;
+ (NSString *)generateUtf16RandStringLength:(NSUInteger)length;

@end
