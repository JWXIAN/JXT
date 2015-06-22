//
//  JWProfileModel.m
//  JXT
//
//  Created by JWX on 15/6/20.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWProfileModel.h"

@implementation JWProfileModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.profiles = [NSMutableArray array];
    }
    return self;
}
@end
