//
//  CBTDefaultsManager.h
//  ShadeApps
//
//  Created by Sergey Grischyov on 12.08.14.
//  Copyright (c) 2014 ShadeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHDDefaultsManager : NSObject

+ (void)setSavedValue:(id)value forKey:(id)key;
+ (id)savedValueForKey:(id)key;

//Deprecated
+ (BOOL)authInProcess DEPRECATED_ATTRIBUTE;

+ (void)setAuthInProcess:(BOOL)value DEPRECATED_ATTRIBUTE;

+ (NSString *)devicePushToken DEPRECATED_ATTRIBUTE;

+ (void)setDevicePushToken:(NSString *)pushToken DEPRECATED_ATTRIBUTE;

+ (NSString *)foursquareCode DEPRECATED_ATTRIBUTE;

+ (void)setFoursquareCode:(NSString *)code DEPRECATED_ATTRIBUTE;


@end
