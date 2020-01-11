//
//  CustomView.m
//  testFrameAndBounds
//
//  Created by Michael Sidoruk on 11.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

//JUST TESTING
//JUST TESTING
//JUST TESTING

#import "CustomView.h"
@interface CustomView ()
@property (weak, nonatomic) UIView *view;
@property (weak, nonatomic) UIView *forView;

@property (weak, nonatomic) UIView *popUpView;
@property (weak, nonatomic) UIView *backgroundView;
@property (weak, nonatomic) UILabel *textLabel;
@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame withText:(NSString *)text inView:(UIView *)view forAreaView:(UIView *)forAreaView
{
    self = [super initWithFrame:frame];
    if (self) {
        self.view = view;
        self.text = text;
        self.forView = forAreaView;
        [self setupPopUpView];
        [self setupPopUpViewShowAnimation];
        [self setupPopUpViewHideAnimation];
    }
    return self;
}

#pragma mark - Show AlertAnimation
- (void)setupPopUpViewShowAnimation {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapBlockView:)];
    [self.forView addGestureRecognizer:tapGesture];
}

- (void)handleTapBlockView:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.3/1.5 animations:^{
        self.popUpView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            self.popUpView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                self.popUpView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        self.backgroundView.alpha = 1;
    }];
}

#pragma mark - Hide AlertAnimation
- (void)setupPopUpViewHideAnimation {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapView:)];
    [self.backgroundView addGestureRecognizer:tapGesture];
}

- (void)handleTapView:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundView.alpha = 0;
        self.popUpView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    }];
}

#pragma mark - Configure Views
- (void)setupPopUpView {
    [self.forView setHidden:YES];
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame))];
    UIView *popUpView = [[UIView alloc]init];
    UILabel *label = [[UILabel alloc]init];
    
    self.backgroundView = backgroundView;
    self.popUpView = popUpView;
    self.textLabel = label;
    
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.popUpView];
    [self.popUpView addSubview:self.textLabel];
    
    self.backgroundView.alpha = 0;
    self.backgroundView.backgroundColor = [UIColor colorWithRed:50/255 green:50/255 blue:50/255 alpha:0.2];
    
    self.popUpView.backgroundColor = [UIColor whiteColor];
    self.popUpView.layer.cornerRadius = 5;
    self.popUpView.frame = CGRectMake(CGRectGetMidX(self.view.frame) - (CGRectGetMaxX(self.view.frame) - 25) / 2,
                                      CGRectGetMidY(self.view.frame) - 75,
                                      CGRectGetMaxX(self.view.frame) - 25,
                                      140);
    self.popUpView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);

    self.textLabel.text = @"Apple's documantation said, \"Do not use frame if view is transformed since it will not correctly reflect the actual location of the view. Use bounds + center instead\". So as the view was rotated you cannot set your own frame, only read it.";
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.numberOfLines = 0;
    self.textLabel.frame = CGRectMake(10, 10,
                                      CGRectGetMaxX(self.popUpView.bounds) - 20,
                                      140);
    [self.textLabel sizeToFit];
}

@end

//
//    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.9 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.alertView.frame = CGRectMake(CGRectGetMidX(self.view.frame) - (CGRectGetMaxX(self.view.frame) - 25) / 2,
//                                          CGRectGetMidY(self.view.frame) - 75,
//                                          CGRectGetMaxX(self.view.frame) - 25,
//                                          150);
//        self.textLabel.frame = CGRectMake(10, 10,
//                                          CGRectGetMaxX(self.alertView.bounds) - 20,
//                                          150);
//        [self.textLabel sizeToFit];
//    } completion:^(BOOL finished) {
//
//    }];
    
//    [UIView animateWithDuration:0.3 animations:^{
//        self.alertView.frame = CGRectMake(CGRectGetMidX(self.view.frame) - (CGRectGetMaxX(self.view.frame) - 25) / 2,
//                                          CGRectGetMidY(self.view.frame) - 75,
//                                          CGRectGetMaxX(self.view.frame) - 25,
//                                          150);
//        self.textLabel.frame = CGRectMake(10, 10,
//                                          CGRectGetMaxX(self.alertView.bounds) - 20,
//                                          150);
//        [self.textLabel sizeToFit];
//    }];
//


//    [UIView animateWithDuration:0.3 animations:^{
//
//
//        self.alertView.frame = CGRectMake(CGRectGetMidX(self.view.bounds),
//                                          CGRectGetMidY(self.view.bounds), 0, 0);
//        self.textLabel.frame = CGRectMake(CGRectGetMidX(self.alertView.bounds),
//                                          CGRectGetMidY(self.alertView.bounds), 0, 0);
//    } completion:^(BOOL finished) {
//        [self.backgroundView removeFromSuperview];
//        [self.alertView removeFromSuperview];
//    }];

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.testImageView setImage:[UIImage imageNamed:@"corgi"]];
//        [self setupSliders];
//        [self updateLabels];
//        self.testImageView.backgroundColor = [UIColor redColor];
//    });
//}
