//
//  SHDResponseSerializer.h
//  ShadeApps
//
//  Created by Grischyov Sergey on 27.07.14.
//  Copyright (c) 2014 ShadeApps. All rights reserved.
//

#import "AFURLResponseSerialization.h"

/// NSError userInfo key that will contain response data
static NSString * const JSONResponseSerializerWithDataKey = @"JSONResponseSerializerWithDataKey";

@interface SHDResponseSerializer : AFJSONResponseSerializer

@end
