//
//  NSObject+TypingIndicatorView.h
//  Pods
//
//  Created by Mohit Saini on 03/03/17.
//
//

#import <UIKit/UIKit.h>
#import "SLKTypingIndicatorProtocol.h"

static CGFloat kTypingIndicatorViewMinimumHeight = 80.0;
static CGFloat kTypingIndicatorViewAvatarHeight = 30.0;

@interface TypingIndicatorView : UIView <SLKTypingIndicatorProtocol>

- (void)presentIndicatorWithName:(NSString *)name image:(UIImage *)image;
- (void)dismissIndicator;

@end

