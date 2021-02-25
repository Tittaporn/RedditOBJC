//
//  DVMPost.m
//  Reddit-C
//
//  Created by Lee McCormick on 2/25/21.
//

#import "DVMPost.h"

@implementation DVMPost

-(instancetype)initWithTitle:(NSString *)title ups: (NSInteger )ups commentCount:(NSNumber *)commentCount
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _ups = ups;
        _commentCount = commentCount;
        
    }
    return self;
}

@end

@implementation DVMPost (JSONConvertible)
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSDictionary *dataDict = dictionary[@"data"];
    NSString *title = dataDict[@"title"];
    NSInteger ups = [dataDict[@"ups"] integerValue];
    NSNumber *commentCount = dataDict[@"num_comments"];
    
    return  [self initWithTitle:title ups:ups commentCount:commentCount];
    
    
}
@end
