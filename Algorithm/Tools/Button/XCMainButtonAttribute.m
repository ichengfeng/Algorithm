//
//  XCMainButtonAttribute.m
//  lib-ui
//
//  Created by jinfeng on 2020/9/1.
//

#import "XCMainButtonAttribute.h"

@implementation XCMainButtonAttribute

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColors = @[(id)[UIColor colorWithRed:255/255.0 green:15/255.0 blue:45/255.0 alpha:1.0].CGColor,(id)[UIColor colorWithRed:255/255.0 green:25/255.0 blue:97/255.0 alpha:1.0].CGColor];
        self.textColor = [UIColor whiteColor];
        self.borderLineColor = nil;
        self.pressTextColor = [UIColor whiteColor];
        self.pressBackgroundColors = self.backgroundColors;
        self.textColor = [UIColor whiteColor];
        self.pressBorderLineColor = nil;
        self.pressMaskColor = [UIColor colorWithRed:94/255.0 green:4/255.0 blue:4/255.0 alpha:0.1];
        self.disableTextColor = [UIColor whiteColor];
        self.disableBorderLineColor = nil;
        self.disableBackgroundColors = @[(id)[UIColor colorWithRed:255/255.0 green:15/255.0 blue:45/255.0 alpha:1.0].CGColor,(id)[UIColor colorWithRed:255/255.0 green:25/255.0 blue:97/255.0 alpha:1.0].CGColor];
        self.disalbeAlpha = 0.3;
    }
    return self;
}

@end
