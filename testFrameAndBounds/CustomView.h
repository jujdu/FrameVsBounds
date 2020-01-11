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
@property (weak, nonatomic) NSString *text;

- (instancetype)initWithFrame:(CGRect)frame withText:(NSString *)text inView:(UIView *)view forAreaView:(UIView *)forAreaView;
@end

NS_ASSUME_NONNULL_END
