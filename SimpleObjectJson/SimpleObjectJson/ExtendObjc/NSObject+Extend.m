//
//  NSObject+Extend.m
//
//  Created by Dleviathan on 4/12/16.
//  Copyright © 2016 dleviathan. All rights reserved.
//

#import "NSObject+Extend.h"
#import "NSString+Extend.h"
#import <objc/runtime.h>
@implementation NSObject (Extend)

- (NSArray *)propertyList {
    Class currentClass = [self class];
    
    NSMutableArray *propertyList = [[NSMutableArray alloc] init];
    do {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(currentClass, &outCount);
        
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            
            NSString *propertyName = [NSString stringWithFormat:@"%s", property_getName(property)];
            [propertyList addObject:propertyName];
        }
        free(properties);
        currentClass = [currentClass superclass];
    } while ([currentClass superclass]);
    
    return propertyList;
}

- (Class) classOfPropertyNamed:(NSString*)keyPath {
    Class class = 0;
    
    unsigned int n = 0;
    objc_property_t* properties = class_copyPropertyList(self.class, &n);
    for (unsigned int i=0; i<n; i++) {
        objc_property_t* property = properties + i;
        NSString* name = [NSString stringWithCString:property_getName(*property) encoding:NSUTF8StringEncoding];
        if (![keyPath isEqualToString:name]) continue;
        
        const char* attributes = property_getAttributes(*property);
        if (attributes[1] == '@') {
            NSMutableString* className = [NSMutableString new];
            for (int j=3; attributes[j] && attributes[j]!='"'; j++){
                [className appendFormat:@"%c", attributes[j]];
            }
            if([className indexOf:@"<"] != -1 && [className indexOf:@">"] != -1){
                className = [[className substringToIndex:[className indexOf:@"<"]] mutableCopy];
            }
            class = NSClassFromString(className);
        }
        break;
    }
    free(properties);
    
    return class;
}

-(NSString *) classNameOfProperty:(NSString *)propertyName{
    NSString *sName = nil;
    unsigned int n = 0;
    objc_property_t* properties = class_copyPropertyList(self.class, &n);
    for (unsigned int i=0; i<n; i++) {
        objc_property_t* property = properties + i;
        NSString* name = [NSString stringWithCString:property_getName(*property) encoding:NSUTF8StringEncoding];
        if (![propertyName isEqualToString:name]) continue;
        
        const char* attributes = property_getAttributes(*property);
        if (attributes[1] == '@') {
            NSMutableString* className = [NSMutableString new];
            for (int j=3; attributes[j] && attributes[j]!='"'; j++){
                [className appendFormat:@"%c", attributes[j]];
            }
            sName = className;
        }
        break;
    }
    free(properties);
    return sName;
}
@end
