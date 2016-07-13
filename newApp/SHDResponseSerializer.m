//
//  SHDResponseSerializer.m
//  ShadeApps
//
//  Created by Grischyov Sergey on 27.07.14.
//  Copyright (c) 2014 ShadeApps. All rights reserved.
//

#import "SHDResponseSerializer.h"

@implementation SHDResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
	id JSONObject = [super responseObjectForResponse:response data:data error:error];
	if (*error != nil) {
		NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
		if (data == nil) {
            //			// NOTE: You might want to convert data to a string here too, up to you.
            //			userInfo[JSONResponseSerializerWithDataKey] = @"";
			userInfo[JSONResponseSerializerWithDataKey] = [NSData data];
		} else {
            //			// NOTE: You might want to convert data to a string here too, up to you.
            //			userInfo[JSONResponseSerializerWithDataKey] = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *rd = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:error];
            if (rd) {
                userInfo[JSONResponseSerializerWithDataKey] = rd;
                userInfo[JSONResponseSerializerWithDataKey] = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            }
		}
		NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
		(*error) = newError;
	}
    
	return (JSONObject);
}

@end
