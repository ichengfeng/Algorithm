//
//  XCBadgeView.h
//  lib-ui-xinxuan
//
//  Created by jinfeng on 2020/9/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, XCBadgeType) {
    XCBadgeNumberType,
    XCBadgePointType,
//    XCBadgeImageType,
};

@interface XCBadgeView : UIView

+ (instancetype)badgeWithType:(XCBadgeType)badgeType;

@property (nonatomic, readonly) XCBadgeType badgeType;

/// 最大标记显示，默认99，超出则显示‘99+’
@property (nonatomic) NSUInteger maximumValue;

/// 角标数，当‘badgeType==XCBadgePointType’时，只有0和非0的区别
@property (nonatomic) NSUInteger badgeValue;

/// 自定义颜色
@property (nonatomic, strong, nullable) UIColor *badgeValueColor;
@property (nonatomic, strong, nullable) UIColor *badgeBackgroundColor;
@property (nonatomic, strong, nullable) UIColor *badgeShadowColor;

@end

NS_ASSUME_NONNULL_END
