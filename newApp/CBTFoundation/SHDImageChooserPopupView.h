//
//  SHDImageChooserPopupView.h
//  Swaggy
//
//  Created by Сергей Грищёв on 30.11.15.
//  Copyright © 2015 ShadeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SHDImageChooserPopupView;

@protocol SHDImageChooserPopupViewDelegate <NSObject>

@optional

//View Button actions

- (void)btnMakePhotoTapped:(SHDImageChooserPopupView *)senderView;
- (void)btnChooseFromLibraryTapped:(SHDImageChooserPopupView *)senderView;
- (void)btnCancelTapped:(SHDImageChooserPopupView *)senderView;

@end

@interface SHDImageChooserPopupView : UIView

@property (nonatomic, assign) id <SHDImageChooserPopupViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *container;

@property (weak, nonatomic) IBOutlet UIButton *btnMakePhoto;

@property (weak, nonatomic) IBOutlet UIButton *btnChooseFromLibrary;

@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

@end
