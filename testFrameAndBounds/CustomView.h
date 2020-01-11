//
//  CustomView.h
//  testFrameAndBounds
//
//  Created by Michael Sidoruk on 11.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomView : UIView
@property (weak, nonatomic) UIView *alertView;
@property (weak, nonatomic) UIView *backgroundView;
@end

NS_ASSUME_NONNULL_END
