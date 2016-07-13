//
//  SHDNetwork.h
//  ShadeApps
//
//  Created by Сергей Грищёв on 16.09.15.
//  Copyright (c) 2015 ShadeApps. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@protocol SHDNetworkDelegate;

@interface SHDNetwork : AFHTTPSessionManager

@property (nonatomic, weak) id <SHDNetworkDelegate>delegate;

+ (SHDNetwork *)sharedInstance;
- (instancetype)initWithBaseURL:(NSURL *)url;

- (void)registerMerchantWithData:(NSDictionary *)data;
- (void)registerStaffWithPin:(NSString *)pin andData:(NSDictionary *)data;
- (void)checkStaffPIN:(NSString *)pin;

- (void)restorePasswordWithEmail:(NSString *)email;

- (void)loadCurrencies;

@end

@protocol SHDNetworkDelegate <NSObject>
@optional

//Registration
- (void)networkingManager:(SHDNetwork *)network didRegisterMerchantWithResult:(id)responseObject andError:(NSError *)error;
- (void)networkingManager:(SHDNetwork *)network didRegisterStaffWithResult:(id)responseObject andError:(NSError *)error;
- (void)networkingManager:(SHDNetwork *)network didCheckPinWithResult:(id)responseObject andError:(NSError *)error;

//Password Reset
- (void)networkingManager:(SHDNetwork *)network didResetPassword:(id)responseObject andError:(NSError *)error;

//Currencies
- (void)networkingManager:(SHDNetwork *)network didLoadCurrenciesWithResult:(id)responseObject andError:(NSError *)error;

@end