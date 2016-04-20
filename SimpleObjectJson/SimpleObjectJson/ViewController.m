//
//  ViewController.m
//  SimpleObjectJson
//
//  Created by Dleviathan on 4/20/16.
//  Copyright © 2016 dleviathan. All rights reserved.
//

#import "ViewController.h"
#import "TestObjc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *sString = @"{\"status\":\"OK\",\"keyword\":\"\",\"my_area\":[{\"setting\":\"abc\\n101\\t418\\n101\\t417\\n101\\t402\\n101\\t401\\n101\\t404\\n101\\t434\\n101\\t433\\n101\\t435\\n101\\t438\\n101\\t437\\n101\\t440\\n101\\t441\\n101\\t439\\n101\\t442\\n\",\"id\":\"0\",\"label\":\"abc\"},{\"setting\":\"cde\\n24\\t43\\n24\\t51\\n\",\"id\":\"1\",\"label\":\"cde\"}],\"current_area\":\"0,1,2\",\"old_area\":\"\",\"alarm_setting\":{\"ledFlashId\":0,\"soundVolume\":0,\"alarmTime\":\"5,30\",\"selectRange1\":\"\",\"selectRange2\":\"\",\"selectRange3\":\"\",\"modeOnDefault\":1,\"modeOnSilentMode\":2,\"notificationBindingMode\":1,\"vibrationType\":0,\"modeOnCalling\":4,\"soundEnabled\":false,\"ledColorId\":0,\"ledEnabled\":false},\"main_setting\":{\"hideDescription\":false,\"columnWidthId\":3,\"showPgListOnStart\":false,\"currentTimeLineWidthId\":3,\"fontSizeId\":1,\"TouchWaitTimeId\":300,\"showZoomButton\":false},\"create_time\":\"2015-12-02 11:00:09\",\"abd_item\":[1,2,3,4,5], \"string_ar\":[\"SDAD\", \"DSDA\"]}";
        TestObjc *test = [[TestObjc alloc] initFromString:sString];
    NSLog(@"[%@ >> %@ >> %d]%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, test.alarm_setting.alarmTime);
    NSLog(@"[%@ >> %@ >> %d]%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, ((ObjArea *)test.my_area[1]).label);
    NSLog(@"[%@ >> %@ >> %d]%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, test.create_time);
    NSLog(@"[%@ >> %@ >> %d]%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, test.abd_item);
    NSLog(@"[%@ >> %@ >> %d]%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, test.string_ar[1]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
