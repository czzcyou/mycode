



//NSUserDefaults一种轻量级的 本地存储
#import "ZZConfiguration.h"

@implementation ZZConfiguration

+ (instancetype)sharedConfigration {
    static ZZConfiguration *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ZZConfiguration alloc] init];
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
