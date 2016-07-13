//
//  SHDImageChooser.h
//  Swaggy
//
//  Created by Сергей Грищёв on 01.08.15.
//  Copyright (c) 2015 ShadeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SHDChooserFinishBlock)(UIImage *chosenImage);

@interface SHDImageChooser : NSObject

+ (SHDImageChooser *)sharedInstance;

- (void)chooseImageFromViewController:(UIViewController *)parentVC withBlock:(SHDChooserFinishBlock)finishBlock;

@end
