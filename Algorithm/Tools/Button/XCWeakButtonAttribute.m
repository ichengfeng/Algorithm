//
//  XCWeakButtonAttribute.m
//  lib-ui
//
//  Created by jinfeng on 2020/9/1.
//

#import "XCWeakButtonAttribute.h"

@implementation XCWeakButtonAttribute

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColors = nil;
        self.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        self.borderLineColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:0.4];
        self.pressTextColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        self.pressBackgroundColors = @[(id)[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1].CGColor];
        self.pressBorderLineColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
        self.pressMaskColor = nil;
        self.disableTextColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
        self.disableBorderLineColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
        self.disableBackgroundColors = @[[UIColor whiteColor]];
    }
    return self;
}

@end
