//
//  TestObjc.h
//  SimpleObjectJson
//
//  Created by Dleviathan on 4/20/16.
//  Copyright © 2016 dleviathan. All rights reserved.
//

#import "ObjBaseJson.h"

//IMPORTANT this
@protocol ObjArea
@end

@interface ObjAlarmSettings : ObjBaseJson

@property (nonatomic, retain) NSString *selectRange1;
@property (nonatomic, retain) NSString *selectRange2;
@property (nonatomic, retain) NSString *selectRange3;
@property (nonatomic, retain) NSString *alarmTime;
@property (nonatomic, assign) BOOL soundEnabled;
@property (nonatomic, assign) BOOL ledEnabled;
@property (nonatomic, assign) int ledColorId;
@property (nonatomic, assign) int ledFlashId;
@property (nonatomic, assign) int modeOnDefault;
@property (nonatomic, assign) int soundVolume;
@property (nonatomic, assign) int notificationBindingMode;
@property (nonatomic, assign) int modeOnSilentMode;
@property (nonatomic, assign) int vibrationType;
@property (nonatomic, assign) int modeOnCalling;

@end

@interface ObjArea : ObjBaseJson
@property (nonatomic, retain) NSString *setting;
@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *label;
@end


@interface TestObjc : ObjBaseJson
@property (nonatomic, retain) NSArray<ObjArea> *my_area; //need add protocol
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *keyword;
@property (nonatomic, retain) NSString *current_area;
@property (nonatomic, retain) NSString *old_area;
@property (nonatomic, retain) ObjAlarmSettings *alarm_setting;
@property (nonatomic, retain) NSString *create_time;
@property (nonatomic, retain) NSArray* abd_item;
@property (nonatomic, retain) NSArray* string_ar;
@end