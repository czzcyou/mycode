//
//  Configuration.m
//  SF
//
//  Created by CYZ on 16/1/1.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

+ (instancetype)sharedConfigration {
    static Configuration *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[Configuration alloc] init];
    });
    
    return _sharedClient;
}

- (void)setUserID:(NSString *)userID {
    [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"kUseId"];
}

- (NSString *)userID {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"kUseId"];
}


- (void)setToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"kToken"];
}

- (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"kToken"];
}

@end
