//
//  CustomView.m
//  testFrameAndBounds
//
//  Created by Michael Sidoruk on 11.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()
@property (weak, nonatomic) UIView *view;
@end

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame inView:(UIView *)view
{
    self = [super initWithFrame:frame];
    if (self) {
        self.view = view;
    }
    return self;
}

#pragma mark - Show AlertAnimation
- (void)setupAlertViewShowAnimation {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapBlockView:)];
//    [self.blockView addGestureRecognizer:tapGesture];
}

- (void)handleTapBlockView:(UITapGestureRecognizer *)tapGesture {
    UILabel *label = [[UILabel alloc]init];
    label.text = @"Apple's documantation said, \"Do not use frame if view is transformed since it will not correctly reflect the actual location of the view. Use bounds + center instead\". So as the view was rotated you cannot set your own frame, only read it.";
    label.textAlignment = NSTextAlignmentLeft;
    label.contentMode = UIViewContentModeTopLeft;
    [UIView animateWithDuration:0.3 animations:^{
        self.alertView.frame = CGRectMake(CGRectGetMidX(self.view.frame) - (CGRectGetMaxX(self.view.frame) - 25) / 2,
                                          CGRectGetMidY(self.view.frame) - 75,
                                          CGRectGetMaxX(self.view.frame) - 25,
                                          150);
        [self.alertView addSubview:label];
        label.frame = CGRectMake(10, 10,
                                 CGRectGetMaxX(self.alertView.frame) - 20,
                                 150);
        label.numberOfLines = 0;
        [label sizeToFit];
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        self.backgroundView.alpha = 1;
    }];
}

#pragma mark - Hide AlertAnimation
- (void)setupAlertViewHideAnimation {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapView:)];
    [self.backgroundView addGestureRecognizer:tapGesture];
}

- (void)handleTapView:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundView.alpha = 0;
        self.alertView.frame = CGRectMake(CGRectGetMidX(self.view.frame),
                                          CGRectGetMidY(self.view.frame), 0, 0);
    } completion:^(BOOL finished) {
//        [self.backgroundView removeFromSuperview];
//        [self.alertView removeFromSuperview];
    }];
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
