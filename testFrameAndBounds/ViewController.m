//
//  ViewController.m
//  testFrameAndBounds
//
//  Created by Michael Sidoruk on 10.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView *popUpView;
@property (weak, nonatomic) UIView *backgroundView;
@property (weak, nonatomic) UILabel *textLabel;
@end

@implementation ViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view sendSubviewToBack:self.testView];
    [self.testImageView setImage:[UIImage imageNamed:@"corgi"]];
    self.testImageView.backgroundColor = [UIColor redColor];

    [self setupPopUpView];
    [self setupPopUpViewShowAnimation];
    [self setupPopUpViewHideAnimation];
    
    [self setupSliders];
    [self updateLabels];
}

#pragma mark - Show AlertAnimation
- (void)setupPopUpViewShowAnimation {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapBlockView:)];
    [self.blockAreaView addGestureRecognizer:tapGesture];
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
    [self.blockAreaView setHidden:YES];
    
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
    self.textLabel.numberOfLines = 0;
    self.textLabel.frame = CGRectMake(10, 10,
                                      CGRectGetMaxX(self.popUpView.bounds) - 20,
                                      140);
    [self.textLabel sizeToFit];
}

- (void)setupSliders {
    self.frameXSlider.minimumValue       = -CGRectGetMaxX(self.view.frame);
    self.frameYSlider.minimumValue       = -CGRectGetMaxY(self.view.frame);
    self.frameWidthSlider.minimumValue   = 0;
    self.frameHeightSlider.minimumValue  = 0;
    self.boundsXSlider.minimumValue      = -CGRectGetMaxX(self.view.bounds);
    self.boundsYSlider.minimumValue      = -CGRectGetMaxY(self.view.bounds);
    self.boundsWidthSlider.minimumValue  = 0;
    self.boundsHeightSlider.minimumValue = 0;
    self.centerXSlider.minimumValue      = 0 - CGRectGetMidX(self.testImageView.frame);;
    self.centerYSlider.minimumValue      = 0 - CGRectGetMidY(self.testImageView.frame);;
    self.rotationViewSlider.minimumValue = 0;
    self.scaleViewSlider.minimumValue = 0;

    self.frameXSlider.maximumValue       = CGRectGetMaxX(self.view.frame);
    self.frameYSlider.maximumValue       = CGRectGetMaxY(self.view.frame);
    self.frameWidthSlider.maximumValue   = CGRectGetWidth(self.view.frame);
    self.frameHeightSlider.maximumValue  = CGRectGetHeight(self.view.frame);
    self.boundsXSlider.maximumValue      = CGRectGetMaxX(self.view.bounds);//Here can be random value, testView bounds independ on view bounds
    self.boundsYSlider.maximumValue      = CGRectGetMaxY(self.view.bounds);//Here can be random value, testView bounds independ on view bounds
    self.boundsWidthSlider.maximumValue  = CGRectGetWidth(self.view.bounds);//Here can be random value, testView bounds independ on view bounds
    self.boundsHeightSlider.maximumValue = CGRectGetHeight(self.view.bounds);//Here can be random value, testView bounds independ on view bounds
    self.centerXSlider.maximumValue      = CGRectGetMaxX(self.view.frame) + CGRectGetMidX(self.testImageView.frame);
    self.centerYSlider.maximumValue      = CGRectGetMaxY(self.view.frame) + CGRectGetMidY(self.testImageView.frame);
    self.rotationViewSlider.maximumValue = 2 * M_PI;
    self.scaleViewSlider.maximumValue = 4;
    
    self.frameXSlider.value       = self.testView.frame.origin.x;
    self.frameYSlider.value       = self.testView.frame.origin.y;
    self.frameWidthSlider.value   = self.testView.frame.size.width;
    self.frameHeightSlider.value  = self.testView.frame.size.height;
    self.boundsXSlider.value      = self.testView.bounds.origin.x;
    self.boundsYSlider.value      = self.testView.bounds.origin.y;
    self.boundsWidthSlider.value  = self.testView.bounds.size.width;
    self.boundsHeightSlider.value = self.testView.bounds.size.height;
    self.centerXSlider.value      = self.testView.center.x;
    self.centerYSlider.value      = self.testView.center.y;
}

- (void)updateLabels {
    self.frameXLabel.text       = [NSString stringWithFormat:@"frame x=%d", (int)(self.testView.frame.origin.x)];
    self.frameYLabel.text       = [NSString stringWithFormat:@"frame y=%d", (int)(self.testView.frame.origin.y)];
    self.frameWidthLabel.text   = [NSString stringWithFormat:@"frame width=%d", (int)(self.testView.frame.size.width)];
    self.frameHeightLabel.text  = [NSString stringWithFormat:@"frame height=%d", (int)(self.testView.frame.size.height)];
    self.boundsXLabel.text      = [NSString stringWithFormat:@"bounds x=%d", (int)(self.testView.bounds.origin.x)];
    self.boundsYLabel.text      = [NSString stringWithFormat:@"bounds y=%d", (int)(self.testView.bounds.origin.y)];
    self.boundsWidthLabel.text  = [NSString stringWithFormat:@"bounds width=%d", (int)(self.testView.bounds.size.width)];
    self.boundsHeightLabel.text = [NSString stringWithFormat:@"bounds height=%d", (int)(self.testView.bounds.size.height)];
    self.centerXLabel.text      = [NSString stringWithFormat:@"center x=%d", (int)(self.testView.center.x)];
    self.centerYLabel.text      = [NSString stringWithFormat:@"center y=%d", (int)(self.testView.center.y)];
    self.rotationViewLabel.text = [NSString stringWithFormat:@"rotation view=%1.1f", (self.rotationViewSlider.value)];
    self.scaleViewLabel.text    = [NSString stringWithFormat:@"scale view=%1.1f", (self.scaleViewSlider.value)];
}

#pragma mark - Support methods

- (void)animateViewChanges:(void (^)(CGRect frame, CGRect bounds))block {
    CGRect frame = self.testView.frame;
    CGRect bounds = self.testView.bounds;
    block(frame, bounds);
    [self updateLabels];
    [self setupSliders];
//    [UIView animateWithDuration:0.1 animations:^{
//    }];
}

#pragma mark - Test Frames
- (IBAction)changeFrameX:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        frame.origin.x = sender.value;
        self.testView.frame = frame;
    }];
}

- (IBAction)changeFrameY:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        frame.origin.y = sender.value;
        self.testView.frame = frame;
    }];
}

- (IBAction)changeFrameWidth:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        frame.size.width = sender.value;
        self.testView.frame = frame;
    }];
}

- (IBAction)changeFrameHeight:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        frame.size.height = sender.value;
        self.testView.frame = frame;
    }];
}

#pragma mark - Test Bounds
- (IBAction)changeBoundsX:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        bounds.origin.x = sender.value;
        self.testView.bounds = bounds;
    }];
}

- (IBAction)changeBoundsY:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        bounds.origin.y = sender.value;
        self.testView.bounds = bounds;
    }];
}

- (IBAction)changeBoundsWidth:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        bounds.size.width = sender.value;
        self.testView.bounds = bounds;
    }];
}

- (IBAction)changeBoundsHeight:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        bounds.size.height = sender.value;
        self.testView.bounds = bounds;
    }];
}

#pragma mark - Test Center
- (IBAction)changeCenterX:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        CGPoint point = CGPointMake(sender.value, self.testView.center.y);
        self.testView.center = point;
    }];
}

- (IBAction)changeCenterY:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        CGPoint point = CGPointMake(self.testView.center.x, sender.value);
        self.testView.center = point;
    }];
}

#pragma mark - Test Rotation & Scale

/*
 because Apple's doc: "frame is animatable. do not use frame if view is transformed since it will not correctly reflect the actual
 location of the view. use bounds + center instead."
 
 You cannot set new frames after CGAffineTransformMakeRotation, however it works with CGAffineTransformMakeTranslation & CGAffineTransformMakeScale. Why?
 */

- (IBAction)rotateView:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        if (sender.value == 0) {
            [self.frameXSlider setEnabled:YES];
            [self.frameYSlider setEnabled:YES];
            [self.frameWidthSlider setEnabled:YES];
            [self.frameHeightSlider setEnabled:YES];
            [self.blockAreaView setHidden:YES];
        } else {
            [self.frameXSlider setEnabled:NO];
            [self.frameYSlider setEnabled:NO];
            [self.frameWidthSlider setEnabled:NO];
            [self.frameHeightSlider setEnabled:NO];
            [self.blockAreaView setHidden:NO];
        }
        self.testView.transform = CGAffineTransformMakeRotation(sender.value);
    }];
}

#pragma mark - Test Scale
- (IBAction)scaleView:(UISlider *)sender {
    [self animateViewChanges:^(CGRect frame, CGRect bounds){
        self.testView.transform = CGAffineTransformMakeScale(sender.value, sender.value);
    }];
}

@end
