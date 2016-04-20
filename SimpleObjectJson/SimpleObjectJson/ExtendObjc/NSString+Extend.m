//
//  NSString+Extend.m
//
//  Created by Dleviathan on 4/12/16.
//  Copyright © 2016 dleviathan. All rights reserved.
//

#import "NSString+Extend.h"

@implementation NSString (Extend)

-(BOOL)isEmpty{
    //self == nil no effect because in NSString string must be !+ nil :|
    if([self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0)
        return true;
    return false;
}

-(int) indexOf:(NSString *)sText{
    NSRange range = [self rangeOfString:sText];
    if ( range.location != NSNotFound ) {
        return (int)range.location;
    } else {
        return -1;
    }
}

@end
