//
//  ViewController.m
//  ImagePicker
//
//  Created by Teonardo on 2019/7/17.
//  Copyright © 2019 Teonardo. All rights reserved.
//

#import "ViewController.h"
#import "LYImagePicker.h"

@interface ViewController () <LYImagePickerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) LYImagePicker *imagePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self layoutUI];
}

#pragma mark - UI
- (void)layoutUI {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setTitle:@"选取图片" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button addTarget:self action:@selector(clickedSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blueColor];
    
    CGFloat buttonHeight = 50;
    button.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - buttonHeight, 100, buttonHeight);
    button.center = CGPointMake(self.view.center.x, button.center.y);
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    imageView.frame = CGRectMake(0, 0, 280, 280);
    imageView.center = self.view.center;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    /**
     注意: 不要在 -viewDidLoad: 方法中使用 presentViewController:animated:completion: 方法,
     应当在 -viewDidAppear: 方法调用以后 再进行present.
     */
}

#pragma mark - Handle Method
- (void)clickedSelectButton:(UIButton *)buttton {
    [self.imagePicker show];
//    [self.imagePicker takePhoto];
}

#pragma mark - LYImagePickerDelegate
- (void)imagePicker:(LYImagePicker *)picker didFinishPickingImage:(UIImage *)image {
    self.imageView.image = image;
}

#pragma mark - Getter
- (LYImagePicker *)imagePicker {
    if (!_imagePicker) {
        _imagePicker = [[LYImagePicker alloc] init];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}


@end
