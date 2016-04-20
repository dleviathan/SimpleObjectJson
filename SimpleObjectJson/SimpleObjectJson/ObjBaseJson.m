//
//  ObjBaseJson.m
//
//  Created by Dleviathan on 12/12/15.
//  Copyright © 2015. All rights reserved.
//

#import "ObjBaseJson.h"

@implementation ObjBaseJson

#pragma mark - init from json string
//Init json string or dictionary to object
-(instancetype)initFromString:(NSString *)info{
    self = [super init];
    if(self) {
        NSError *error = nil;
        NSData *JSONData = [info dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&error];
        
        if (!error && JSONDictionary) {
            for (NSString *property in self.propertyList) {
                id value = JSONDictionary[property];
                if([value isKindOfClass:[NSArray class]]){
                    NSMutableArray *arrObj = [NSMutableArray new];
                    NSString *sClass = [self classNameOfProperty:property];
                    if([sClass indexOf:@"<"] != -1 && [sClass indexOf:@">"] != -1){
                        NSString *sProtocol = [sClass substringWithRange:NSMakeRange([sClass indexOf:@"<"] + 1, [sClass indexOf:@">"] - [sClass indexOf:@"<"] - 1)];
                        for(int i = 0; i < [value count]; i++){
                            id item = [value objectAtIndex:i];
                            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:item
                                                                               options:0
                                                                                 error:nil];
                            NSString *sTemp = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                            Class classTemp = NSClassFromString(sProtocol);
                            id objTemp = [classTemp new];
                            [arrObj addObject:[objTemp initFromString:sTemp]];
                        }
                    }else{
                        for(int i = 0; i < [value count]; i++){
                            id item = [value objectAtIndex:i];
                            [arrObj addObject:item];
                        }
                    }
                    [self setValue:arrObj forKey:property];
                }else if([value isKindOfClass:[NSDictionary class]]){
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:value
                                                                       options:0
                                                                         error:nil];
                    NSString *sTemp = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                    Class classTemp = [self classOfPropertyNamed:property];
                    id objTemp = [classTemp new];
                    [self setValue:[objTemp initFromString:sTemp] forKey:property];
                }else{
                    [self setValue:value forKey:property];
                }
            }
        }
    }
    return  self;
}

#pragma mark - create dictionary from object
//2 cách chạy như nhau
- (NSDictionary *) dictionaryWithPropertiesOfObject:(id)obj
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        if([obj valueForKey:key] != nil)
            [dict setObject:[obj valueForKey:key] forKey:key];
    }
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
    
}

- (NSDictionary *)dictionaryValue
{
    NSMutableArray *propertyKeys = [NSMutableArray array];
    Class currentClass = self.class;
    
    while ([currentClass superclass]) { // avoid printing NSObject's attributes
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(currentClass, &outCount);
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            const char *propName = property_getName(property);
            if (propName) {
                NSString *propertyName = [NSString stringWithUTF8String:propName];
                [propertyKeys addObject:propertyName];
            }
        }
        free(properties);
        currentClass = [currentClass superclass];
    }
    
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

#pragma mark - create json string from object
- (NSString*) createToJsonStringWithPrettyPrint:(BOOL) prettyPrint {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[self dictionaryWithPropertiesOfObject:self]
                                                       options:(NSJSONWritingOptions) (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"[%@ >> %@ >> %d]ERROR: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

@end