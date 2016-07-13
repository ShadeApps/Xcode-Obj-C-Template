//
//  SHDImageChooser.m
//  Swaggy
//
//  Created by Сергей Грищёв on 01.08.15.
//  Copyright (c) 2015 ShadeApps. All rights reserved.
//

#import "SHDImageChooser.h"

@interface SHDImageChooser () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *ourImgPickerController;
@property (nonatomic, copy) SHDChooserFinishBlock finalBlock;

@end

@implementation SHDImageChooser{
    UIViewController *mainParentVC;
}

+ (SHDImageChooser *)sharedInstance{
    static SHDImageChooser *_sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (void)chooseImageFromViewController:(UIViewController *)parentVC withBlock:(SHDChooserFinishBlock)finishBlock{
    mainParentVC = parentVC;
    _finalBlock = finishBlock;

    [self customizeUIImagePickerController];

    UIAlertController *ourAlertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    BOOL hasCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];

    if (hasCamera){
        [ourAlertController addAction: [UIAlertAction actionWithTitle:@"Сделать фото" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            self.ourImgPickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [mainParentVC presentViewController:self.ourImgPickerController animated:YES completion:NULL];
        }]];
    }

    [ourAlertController addAction: [UIAlertAction actionWithTitle:@"Выбрать из фотоальбома" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
            self.ourImgPickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [mainParentVC presentViewController:self.ourImgPickerController animated:YES completion:NULL];
        }
    }]];
    [ourAlertController addAction: [UIAlertAction actionWithTitle:@"Отмена" style: UIAlertActionStyleCancel handler:nil]];
    //[ourAlertController.view setTintColor:[CBTFunctions colorFromHex:@"66cc00"]];
    [mainParentVC presentViewController: ourAlertController animated: YES completion: nil];
}

#pragma mark - Private

#pragma mark UIImagePickerController Methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    UIImage * image = info[UIImagePickerControllerEditedImage];

    if(!image) image = info[UIImagePickerControllerOriginalImage];

    self.finalBlock(image);

    [mainParentVC dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [mainParentVC dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Customizing UIImagePicker
- (void)customizeUIImagePickerController{
    self.ourImgPickerController = [[UIImagePickerController alloc] init];
    self.ourImgPickerController.delegate = self;
    self.ourImgPickerController.allowsEditing = YES;
    self.ourImgPickerController.allowsEditing = YES;
    self.ourImgPickerController.navigationBar.barStyle = UIStatusBarStyleDefault;
    //self.ourImgPickerController.navigationBar.barTintColor = [CBTFunctions colorFromHex:@"fafbfc" ];
    self.ourImgPickerController.navigationBar.translucent = YES;
    //self.ourImgPickerController.navigationBar.tintColor = [CBTFunctions colorFromHex:@"66cc00"];
}

@end