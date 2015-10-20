//
//  systemSetState.h
//  GrabTask
//
//  Created by MBZL on 15/10/19.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface systemSetState : NSObject
@property(nonatomic) BOOL systemPushState;
+(systemSetState*)currentSystemSet;
@end
