//
//  UIView+XCBadge.m
//  lib-ui-xinxuan
//
//  Created by jinfeng on 2020/9/2.
//

#import "UIView+XCBadge.h"
#import <Masonry/Masonry.h>

static int const kBadgeTag = 1104;

@implementation UIView (XCBadge)

- (void)xc_setPointBadge {
    [self xc_setPointBadgeWithTop:-3 left:-3];
}

- (void)xc_setPointBadgeWithTop:(CGFloat)top left:(CGFloat)left {
    UIView *badge = [self viewWithTag:kBadgeTag];
    if (!badge) {
        XCBadgeView *badge = [XCBadgeView badgeWithType:XCBadgePointType];
        badge.tag = kBadgeTag;
        badge.badgeValue = 1;
        [self addSubview:badge];
        [badge mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(top);
            make.left.mas_equalTo(left);
        }];
    } else {
        if ([badge isKindOfClass:[XCBadgeView class]]) {
            XCBadgeView *badgeView = (XCBadgeView *)badge;
            if (badgeView.badgeType == XCBadgePointType) {
                badgeView.badgeValue = 1;
            } else {
                [self xc_clearBadge];
                [self xc_setPointBadge];
            }
        } else {
            NSAssert(NO, @"The tag='1104' conflict");
        }
    }
}

- (void)xc_setBadgeOfNumber:(NSUInteger)number {
    [self xc_setBadgeOfNumber:number top:-7 left:-7];
}

- (void)xc_setBadgeOfNumber:(NSUInteger)number top:(CGFloat)top left:(CGFloat)left {
    UIView *badge = [self viewWithTag:kBadgeTag];
    if (!badge) {
        XCBadgeView *badge = [XCBadgeView badgeWithType:XCBadgeNumberType];
        badge.tag = kBadgeTag;
        badge.badgeValue = number;
        [self addSubview:badge];
        [badge mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(top);
            make.left.equalTo(self.mas_right).offset(left);
        }];
    } else {
        if ([badge isKindOfClass:[XCBadgeView class]]) {
            XCBadgeView *badgeView = (XCBadgeView *)badge;
            if (badgeView.badgeType == XCBadgeNumberType) {
                badgeView.badgeValue = number;
            } else {
                [self xc_clearBadge];
                [self xc_setBadgeOfNumber:number];
            }
        } else {
            NSAssert(NO, @"The tag='1104' conflict");
        }
    }
}

- (void)xc_clearBadge {
    UIView *badge = [self viewWithTag:kBadgeTag];
    if (!badge) {
        return;
    }
    [badge removeFromSuperview];
}

- (XCBadgeView *)xc_badgeView {
    return [self viewWithTag:kBadgeTag];
}

@end
