//
//  NSObject+Extend.h
//
//  Created by Dleviathan on 4/12/16.
//  Copyright © 2016 dleviathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extend)

@property(readonly) NSArray *propertyList;

-(Class)classOfPropertyNamed:(NSString*) propertyName;

-(NSString *) classNameOfProperty:(NSString *)propertyName;
@end
