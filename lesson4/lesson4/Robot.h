//
//  Robot.h
//  lesson4
//
//  Created by Nick on 12/01/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject
@property (nonatomic) int x;
@property (nonatomic) int y;

- (instancetype)init;
- (void)run: (NSString*(^)(void)) action;

@end

NS_ASSUME_NONNULL_END
