//
//  Configuration.h
//  SF
//
//  Created by CYZ on 16/1/1.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configuration : NSObject
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *token;

+ (instancetype)sharedConfigration;
@end
