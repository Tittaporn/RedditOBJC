//
//  DVMPostController.h
//  Reddit-C
//
//  Created by Lee McCormick on 2/25/21.
//

#import <Foundation/Foundation.h>
@class DVMPost;

@interface DVMPostController : NSObject

+(instancetype) shared;

-(void)searchForPostWithSearchTerm:(NSString *)searchTerm
                        completion:(void (^) (NSArray<DVMPost *>*posts, NSError *error))completion;

@end


