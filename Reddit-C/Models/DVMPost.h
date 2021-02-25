//
//  DVMPost.h
//  Reddit-C
//
//  Created by Lee McCormick on 2/25/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMPost : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger ups;
@property (nonatomic, readonly) NSNumber *commentCount;

-(instancetype)initWithTitle:(NSString *)title
                         ups:(NSInteger)ups
                commentCount:(NSNumber *)commentCount;
@end

@interface DVMPost (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id>*)dictionary;

@end

NS_ASSUME_NONNULL_END
