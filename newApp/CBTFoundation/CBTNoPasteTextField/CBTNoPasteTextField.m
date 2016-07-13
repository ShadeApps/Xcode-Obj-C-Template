//
//  BSNoPasteTextField.m
//  timewebmail
//
//  Created by BoogL on 06.09.12.
//  Copyright (c) 2012 timeweb. All rights reserved.
//

#import "CBTNoPasteTextField.h"

@implementation CBTNoPasteTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
	return NO;
}

@end
