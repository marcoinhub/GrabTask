//
//  systemSetState.m
//  GrabTask
//
//  Created by MBZL on 15/10/19.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import "systemSetState.h"
static systemSetState * userSystemState=nil;
@implementation systemSetState
+(systemSetState*)currentSystemSet{
    if (userSystemState==nil) {
        userSystemState=[systemSetState new];
    }
    return userSystemState;

}
@end
