//
//  AppDelegate.m
//  PreferenceModule
//
//  Created by JoAmS on 2017. 6. 14..
//  Copyright © 2017년 t5online. All rights reserved.
//

#import "AppDelegate.h"
#import <NebulaCore/Nebula.h>
#import <NebulaCore/NBPluginService.h>
#import "PreferenceService.h"
#import "PreferencePlugin.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

#pragma mark - NebulaDelegate Methods
- (void)registerServices {
    [Nebula registerService:[NBPluginService new] forKey:SERVICE_KEY_PLUGIN];
    [Nebula registerService:[PreferenceService new] forKey:SERVICE_KEY_PREFERENCE];
}

- (void)loadPlugins {
    NBPluginService* pluginService = [Nebula serviceWithKey:SERVICE_KEY_PLUGIN];
    [pluginService addPluginClass:@"PreferencePlugin" actionGroup:PLUGIN_GROUP_PREFERENCE];
}

@end
