//
//  UILabel+Boldify.h
//  Swaggy
//
//  Created by Сергей Грищёв on 21.11.15.
//  Copyright © 2015 ShadeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Boldify)
- (void) boldSubstring: (NSString*) substring;
- (void) boldRange: (NSRange) range;
@end
