//
//  DVMPostController.m
//  Reddit-C
//
//  Created by Lee McCormick on 2/25/21.
//

#import "DVMPostController.h"
#import "DVMPost.h"

static NSString *const baseURLString = @"https://www.reddit.com/";
static NSString *const rComponent = @"r";
static NSString *const jsonExtension = @"json";

@implementation DVMPostController

+(instancetype)shared
{
    static DVMPostController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[DVMPostController alloc] init];
    });
    return shared;
}

-(void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<DVMPost *> *_Nullable, NSError * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *rURL = [baseURL URLByAppendingPathComponent:rComponent];
    NSURL *searchURL = [rURL URLByAppendingPathComponent:searchTerm];
    
    NSURL *finalURL = [searchURL URLByAppendingPathExtension:jsonExtension];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      
      {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            return completion(nil, error);
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevel = [NSJSONSerialization JSONObjectWithData: data options:0 error:&error];
            NSDictionary *postData = topLevel[@"data"][@"children"];
            NSMutableArray *postsArray = [NSMutableArray array];
            
            for (NSDictionary *dataDict in postData)
            {
                DVMPost *post = [[DVMPost alloc] initWithDictionary:dataDict];
                [postsArray addObject:post];
            }
            completion(postsArray, nil);
        }
        
    }]resume];
    
}
@end

