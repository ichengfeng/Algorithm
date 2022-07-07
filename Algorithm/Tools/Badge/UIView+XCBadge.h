//
//  UIView+XCBadge.h
//  lib-ui-xinxuan
//
//  Created by jinfeng on 2020/9/2.
//

#import <UIKit/UIKit.h>
#import "XCBadgeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XCBadge)

- (void)xc_setPointBadge;

- (void)xc_setPointBadgeWithTop:(CGFloat)top left:(CGFloat)left;

- (void)xc_setBadgeOfNumber:(NSUInteger)number;

- (void)xc_setBadgeOfNumber:(NSUInteger)number top:(CGFloat)top left:(CGFloat)left;

- (void)xc_clearBadge;

@property (nonatomic, strong, readonly, nullable) XCBadgeView *xc_badgeView;

@end

NS_ASSUME_NONNULL_END
