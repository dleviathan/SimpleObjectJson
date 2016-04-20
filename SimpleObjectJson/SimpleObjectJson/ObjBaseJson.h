//
//  ObjBaseJson.h
//
//  Created by Dleviathan on 12/12/15.
//  Copyright © 2015. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extend.h"
#import "NSString+Extend.h"
#import <objc/message.h>

@interface ObjBaseJson : NSObject

- (instancetype)initFromString:(NSString *)info;
- (NSString*) createToJsonStringWithPrettyPrint:(BOOL) prettyPrint __attribute__((unavailable("Don't use not complete, it won't work.")));
- (NSDictionary *)dictionaryValue __attribute__((unavailable("Don't use not complete, it won't work.")));

@end