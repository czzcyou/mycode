//
#import "ZZHttpClient.h"
#import "MBProgressHUD.h"
#import "ZZConfiguration.h"

// 使用一个静态类来封装
static MBProgressHUD *loadingHud = nil;

static NSString * const kBaseURL = @"http://api.segmentfault.com";


@implementation ZZHttpClient
+ (ZZHttpClient *)sharedHTTPClient
{
    static ZZHttpClient *_HTTPClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _HTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    });
    return _HTTPClient;
}


#pragma mark - private
- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        // 设置返回格式
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.requestSerializer setTimeoutInterval:15];
        // 设置请求格式
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    return self;
}


- (void)requestLoginWithName:(NSString *)name password:(NSString *)password SuccessBlock:(SuccessBlock)success failBlock:(FailBlock)fail {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"mail"] = name;
    parameters[@"password"] = password;
    
    
    
    [self POST:@"/user/login" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        fail(error);
    }];
    
}

- (void)requestUserProfileWithSuccessBlock:(SuccessBlock)succces failBlock:(FailBlock)fail {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"token"] = [ZZConfiguration sharedConfigration].token;
    
    NSString *service = [NSString stringWithFormat:@"/user/%@",[ZZConfiguration sharedConfigration].userID];
    [self GET:service parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        succces(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        fail(error);
    }];
}


- (void)requestRegisterWithName:(NSString *)name
                          email:(NSString *)email
                       password:(NSString *)password
                   SuccessBlock:(SuccessBlock)success
                      failBlock:(FailBlock)fail {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"name"] = name;
    parameters[@"email"] = email;
    parameters[@"password"] = password;
    // TODO
    //   self POST:@"" parameters:<#(id)#> success:<#^(NSURLSessionDataTask *task, id responseObject)success#> failure:<#^(NSURLSessionDataTask *task, NSError *error)failure#>
    
    
    
    
    
    
}

- (void)requestMeWithSuccessBlock:(SuccessBlock)succces failBlock:(FailBlock)fail{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"token"] = [ZZConfiguration sharedConfigration].token;
    [self GET:@"/user/me" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        succces(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        fail(error);
    }];
}



@end


