//
//  SHDImageChooserPopupView.m
//  Swaggy
//
//  Created by Сергей Грищёв on 30.11.15.
//  Copyright © 2015 ShadeApps. All rights reserved.
//

#import "SHDImageChooserPopupView.h"

@implementation SHDImageChooserPopupView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    [self initalizeSubviews];
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self == nil) return nil;
    [self initalizeSubviews];
    return self;
}

- (void)initalizeSubviews{
    if (self.subviews.count == 0){
        NSString *nibName = NSStringFromClass([self class]);
        [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        self.bounds = self.container.bounds;
        [self addSubview:self.container];
        
        [self stretchToSuperView:self.container];
        
        CALayer *btnLeaveCommentLayer = [_btnCancel layer];
        [btnLeaveCommentLayer setBorderWidth:1.8f];
        [btnLeaveCommentLayer setBorderColor:[[CBTFunctions colorFromHex:@"a2a7ad"] CGColor]];
        _btnCancel.layer.masksToBounds = YES;
        _btnCancel.layer.shouldRasterize = YES;
        _btnCancel.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
    }
}

- (void) stretchToSuperView:(UIView*) view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSString *formatTemplate = @"%@:|[view]|";
    for (NSString * axis in @[@"H",@"V"]) {
        NSString * format = [NSString stringWithFormat:formatTemplate,axis];
        NSArray * constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:bindings];
        [view.superview addConstraints:constraints];
    }
    
}
- (IBAction)btnMakePhotoTapped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(btnMakePhotoTapped:)]){
        [self.delegate btnMakePhotoTapped:self];
    }
}

- (IBAction)btnChooseFromLibraryTapped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(btnChooseFromLibraryTapped:)]){
        [self.delegate btnChooseFromLibraryTapped:self];
    }
}

- (IBAction)btnCancelTapped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(btnCancelTapped:)]){
        [self.delegate btnCancelTapped:self];
    }
}

@end
