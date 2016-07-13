//
//  CBTDefaultsManager.m
//  ShadeApps
//
//  Created by Sergey Grischyov on 12.08.14.
//  Copyright (c) 2014 ShadeApps. All rights reserved.
//

#import "SHDDefaultsManager.h"

@implementation SHDDefaultsManager

+ (void)setSavedValue:(id)value forKey:(id)key{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)savedValueForKey:(id)key{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

//Deprecated

+ (BOOL)authInProcess{
    return [[NSUserDefaults standardUserDefaults] boolForKey:SHDAuthIsActive];
}

+ (void)setAuthInProcess:(BOOL)value{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:SHDAuthIsActive];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)devicePushToken{
    return [[NSUserDefaults standardUserDefaults] stringForKey:SHDDevicePushTokenKey];
}

+ (void)setDevicePushToken:(NSString *)pushToken{
    [[NSUserDefaults standardUserDefaults] setValue:pushToken forKey:SHDDevicePushTokenKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)foursquareCode{
    return [[NSUserDefaults standardUserDefaults] stringForKey:SHDFoursquareCodeKey];
}

+ (void)setFoursquareCode:(NSString *)code{
    [[NSUserDefaults standardUserDefaults] setValue:code forKey:SHDFoursquareCodeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end