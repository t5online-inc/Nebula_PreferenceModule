//
//  PreferencePlugin.m
//  PreferenceModule
//
//  Created by JoAmS on 2017. 6. 14..
//  Copyright © 2017년 t5online. All rights reserved.
//

#import "PreferencePlugin.h"
#import <NebulaCore/Nebula.h>
#import "PreferenceService.h"

@implementation PreferencePlugin

- (void)get:(NSString*)key defaultValue:(NSString*)defaultValue
{
    NSString* ret = [[Nebula serviceWithKey:SERVICE_KEY_PREFERENCE] getPreference:key defaultValue:defaultValue];
    NSDictionary* retData = [NSDictionary dictionaryWithObjectsAndKeys:
                             @(STATUS_CODE_SUCCESS) , @"code",
                             ret , @"message",
                             nil];
    [self resolve:retData];
}

- (void)set:(NSString*)key value:(NSString*)value
{
    NSInteger statusCode = STATUS_CODE_ERROR;
    
    if([[Nebula serviceWithKey:SERVICE_KEY_PREFERENCE] setPreference:value forKey:key]) {
        statusCode = STATUS_CODE_SUCCESS;
    }
    
    NSDictionary* retData = [NSDictionary dictionaryWithObjectsAndKeys:
                             @(statusCode) , @"code",
                             @"" , @"message",
                             nil];
    [self resolve:retData];
}

- (void)remove:(NSString *)key
{
    NSInteger statusCode = STATUS_CODE_ERROR;
    
    if([[Nebula serviceWithKey:SERVICE_KEY_PREFERENCE] removePreference:key]) {
        statusCode = STATUS_CODE_SUCCESS;
    }
    
    NSDictionary* retData = [NSDictionary dictionaryWithObjectsAndKeys:
                             @(statusCode) , @"code",
                             @"" , @"message",
                             nil];
    [self resolve:retData];
}

- (void)removeAll
{
    NSInteger statusCode = STATUS_CODE_ERROR;
    
    if([[Nebula serviceWithKey:SERVICE_KEY_PREFERENCE] removeAllPreference]) {
        statusCode = STATUS_CODE_SUCCESS;
    }
    
    NSDictionary* retData = [NSDictionary dictionaryWithObjectsAndKeys:
                             @(statusCode) , @"code",
                             @"" , @"message",
                             nil];
    [self resolve:retData];
}

@end
