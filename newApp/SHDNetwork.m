//
//  SHDNetwork.m
//  ShadeApps
//
//  Created by Сергей Грищёв on 16.09.15.
//  Copyright (c) 2015 ShadeApps. All rights reserved.
//

#import "SHDNetwork.h"

#import "SHDResponseSerializer.h"

#define ACTIVE_LOGGING 1

@implementation SHDNetwork

#pragma mark - Lifecycle

+ (SHDNetwork *)sharedInstance{

    static SHDNetwork *_sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:[CBTFunctions apiHostName]]];
    });

    return _sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url{

    self = [super initWithBaseURL:url];

    if (self) {
        [self.requestSerializer setTimeoutInterval:35.0];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

        self.responseSerializer = [SHDResponseSerializer serializer];
//        NSMutableSet *contentTypes = [NSMutableSet setWithSet:[self.responseSerializer acceptableContentTypes]];
//        [contentTypes addObject:@"application/hal+json"];
//        self.responseSerializer.acceptableContentTypes = [NSSet setWithSet:contentTypes];
    }

    return self;
}

#pragma mark - Registration

- (void)registerMerchantWithData:(NSDictionary *)data{
    [self POST:@"clients/register" parameters:data success:^(NSURLSessionDataTask *task, id responseObject){
        if (ACTIVE_LOGGING) NSLog(@"registerMerchantWithData response is %@", responseObject);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didRegisterMerchantWithResult:andError:)]){
            [self.delegate networkingManager:self didRegisterMerchantWithResult:responseObject andError:nil];
        }
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (ACTIVE_LOGGING) NSLog(@"registerMerchantWithData error is %@ and response %@", error, task.response);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didRegisterMerchantWithResult:andError:)]){
            [self.delegate networkingManager:self didRegisterMerchantWithResult:task.response andError:error];
        }
    }];
}

- (void)registerStaffWithPin:(NSString *)pin andData:(NSDictionary *)data{
    NSString *URLString = [NSString stringWithFormat:@"clients/register?pin=%@", pin];
    [self POST:URLString parameters:data success:^(NSURLSessionDataTask *task, id responseObject){
        if (ACTIVE_LOGGING) NSLog(@"registerStaffWithData response is %@", responseObject);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didRegisterStaffWithResult:andError:)]){
            [self.delegate networkingManager:self didRegisterStaffWithResult:responseObject andError:nil];
        }
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (ACTIVE_LOGGING) NSLog(@"registerStaffWithData error is %@ and response %@", error, task.response);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didRegisterStaffWithResult:andError:)]){
            [self.delegate networkingManager:self didRegisterStaffWithResult:task.response andError:error];
        }
    }];
}

- (void)checkStaffPIN:(NSString *)pin{
    NSString *URLString = [NSString stringWithFormat:@"invites/findByPin?pin=%@", pin];
    [self GET:URLString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject){
        if (ACTIVE_LOGGING) NSLog(@"checkStaffPIN response is %@", responseObject);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didCheckPinWithResult:andError:)]){
            [self.delegate networkingManager:self didCheckPinWithResult:responseObject andError:nil];
        }
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (ACTIVE_LOGGING) NSLog(@"checkStaffPIN error is %@ and response %@", error, task.response);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didCheckPinWithResult:andError:)]){
            [self.delegate networkingManager:self didCheckPinWithResult:task.response andError:error];
        }
    }];
}

#pragma mark - Restore 

- (void)restorePasswordWithEmail:(NSString *)email{
    [self POST:@"clients/reset" parameters:@{@"email" : email} success:^(NSURLSessionDataTask *task, id responseObject){
        if (ACTIVE_LOGGING) NSLog(@"restorePasswordWithEmail response is %@", responseObject);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didResetPassword:andError:)]){
            [self.delegate networkingManager:self didResetPassword:responseObject andError:nil];
        }
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (ACTIVE_LOGGING) NSLog(@"restorePasswordWithEmail error is %@ and response %@", error, task.response);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didResetPassword:andError:)]){
            [self.delegate networkingManager:self didResetPassword:task.response andError:error];
        }
    }];
}

#pragma mark - Loading

- (void)loadCurrencies{
    [self GET:@"settings/currency" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject){
        if (ACTIVE_LOGGING) NSLog(@"loadCurrencies response is %@", responseObject);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didLoadCurrenciesWithResult:andError:)]){
            [self.delegate networkingManager:self didLoadCurrenciesWithResult:responseObject andError:nil];
        }
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (ACTIVE_LOGGING) NSLog(@"loadCurrencies error is %@ and response %@", error, task.response);
        if ([self.delegate respondsToSelector:@selector(networkingManager:didLoadCurrenciesWithResult:andError:)]){
            [self.delegate networkingManager:self didLoadCurrenciesWithResult:task.response andError:error];
        }
    }];
}

@end