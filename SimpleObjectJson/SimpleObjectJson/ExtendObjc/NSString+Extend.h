//
//  NSString+Extend.h
//
//  Created by Dleviathan on 4/12/16.
//  Copyright © 2016 dleviathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)

/**
 * check string is empty with trimed, string always != nil
 */
@property(getter=isEmpty, readonly) BOOL isEmpty;

-(int) indexOf:(NSString *)sText;

@end
