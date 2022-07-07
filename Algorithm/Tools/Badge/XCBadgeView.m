//
//  XCBadgeView.m
//  lib-ui-xinxuan
//
//  Created by jinfeng on 2020/9/2.
//

#import "XCBadgeView.h"
#import "lib-ui-macros.h"
#import <Masonry/Masonry.h>

static const int kNumberBadgeHeight = 14;
static const int kPointBadgeHeight = 6;

@interface XCBadgeView ()
@property (nonatomic, assign) XCBadgeType badgeType;
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation XCBadgeView

- (instancetype)init {
    self = [self initWithBadgeType:XCBadgeNumberType];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _maximumValue = 99;
        _badgeValue = 0;
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithBadgeType:(XCBadgeType)badgeType {
    _badgeType = badgeType;
    self = [self initWithFrame:CGRectZero];
    return self;
}

+ (instancetype)badgeWithType:(XCBadgeType)badgeType {
    XCBadgeView *badge = [[XCBadgeView alloc] initWithBadgeType:badgeType];
    return badge;
}

- (void)setupUI {
    self.hidden = YES;
    self.badgeBackgroundColor = nil;
    self.badgeShadowColor = [UIColor clearColor];
    self.layer.shadowOffset = CGSizeMake(0,1);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 1;
    
    if (self.badgeType == XCBadgeNumberType) {
        self.layer.cornerRadius = kNumberBadgeHeight / 2.0;
        self.textLabel.text = @"";
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kNumberBadgeHeight);
            make.top.bottom.equalTo(self);
            make.left.mas_greaterThanOrEqualTo(0);
            make.right.mas_lessThanOrEqualTo(-0);
            make.center.equalTo(self);
        }];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
           make.width.mas_greaterThanOrEqualTo(0);
        }];
    } else if (self.badgeType == XCBadgePointType) {
        self.layer.cornerRadius = kPointBadgeHeight / 2.0;
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kPointBadgeHeight, kPointBadgeHeight));
        }];
    }
}

- (void)setMaximumValue:(NSUInteger)maximumValue {
    _maximumValue = maximumValue;
    self.badgeType = self.badgeType;
}

- (void)setBadgeValue:(NSUInteger)badgeValue {
    _badgeValue = badgeValue;
    if (self.badgeType == XCBadgeNumberType) {
        if (badgeValue == 0 || self.maximumValue == 0) {
            self.textLabel.text = @"";
            self.hidden = YES;
        } else {
            self.hidden = NO;
            if (badgeValue > self.maximumValue) {
                self.textLabel.text = [NSString stringWithFormat:@"%@+",@(self.maximumValue)];
            } else {
                self.textLabel.text = [NSString stringWithFormat:@"%@",@(badgeValue)];
            }
        }
        [self.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            if (badgeValue == 0) {
                make.left.mas_greaterThanOrEqualTo(0);
                make.right.mas_lessThanOrEqualTo(0);
            } else {
                make.left.mas_greaterThanOrEqualTo(3);
                make.right.mas_lessThanOrEqualTo(-3);
            }
        }];
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            if (badgeValue == 0) {
                make.width.mas_greaterThanOrEqualTo(0);
            } else {
                make.width.mas_greaterThanOrEqualTo(kNumberBadgeHeight);
            }
        }];
    } else if (self.badgeType == XCBadgePointType) {
        self.hidden = badgeValue == 0;
    }
}

- (void)setBadgeValueColor:(UIColor *)badgeValueColor {
    _badgeValueColor = badgeValueColor;
    if (!badgeValueColor) {
        self.textLabel.textColor = [UIColor whiteColor];
    } else {
        self.textLabel.textColor = badgeValueColor;
    }
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor {
    _badgeBackgroundColor = badgeBackgroundColor;
    if (!badgeBackgroundColor) {
        self.backgroundColor = UIColorHex(0xf20000);
    } else {
        self.backgroundColor = badgeBackgroundColor;
    }
}

- (void)setBadgeShadowColor:(UIColor *)badgeShadowColor {
    _badgeShadowColor = badgeShadowColor;
    self.layer.shadowColor = badgeShadowColor.CGColor;
}

#pragma mark -- Get

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:11 weight:UIFontWeightRegular];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLabel];
    }
    return _textLabel;
}

@end
