//
//  ViewController.h
//  testFrameAndBounds
//
//  Created by Michael Sidoruk on 10.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@property (weak, nonatomic) IBOutlet UIView *blockView;

@property (weak, nonatomic) IBOutlet UILabel *frameXLabel;
@property (weak, nonatomic) IBOutlet UILabel *frameYLabel;
@property (weak, nonatomic) IBOutlet UILabel *frameWidthLabel;
@property (weak, nonatomic) IBOutlet UILabel *frameHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsXLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsYLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsWidthLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *centerXLabel;
@property (weak, nonatomic) IBOutlet UILabel *centerYLabel;
@property (weak, nonatomic) IBOutlet UILabel *rotationViewLabel;
@property (weak, nonatomic) IBOutlet UILabel *scaleViewLabel;

#pragma mark - Sliders
@property (weak, nonatomic) IBOutlet UISlider *frameXSlider;
@property (weak, nonatomic) IBOutlet UISlider *frameYSlider;
@property (weak, nonatomic) IBOutlet UISlider *frameWidthSlider;
@property (weak, nonatomic) IBOutlet UISlider *frameHeightSlider;
@property (weak, nonatomic) IBOutlet UISlider *boundsXSlider;
@property (weak, nonatomic) IBOutlet UISlider *boundsYSlider;
@property (weak, nonatomic) IBOutlet UISlider *boundsWidthSlider;
@property (weak, nonatomic) IBOutlet UISlider *boundsHeightSlider;
@property (weak, nonatomic) IBOutlet UISlider *centerXSlider;
@property (weak, nonatomic) IBOutlet UISlider *centerYSlider;
@property (weak, nonatomic) IBOutlet UISlider *rotationViewSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleViewSlider;

@end

