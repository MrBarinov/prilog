//
//  Robot.m
//  lesson4
//
//  Created by Nick on 12/01/2024.
//

#import "Robot.h"

@implementation Robot

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.x = 0;
        self.y = 0;
    }
    return self;
}

- (void)run: (NSString*(^)(void)) action {
    NSString *act = action();
    if ([act isEqual:@"up"]) {
        self.y++;
    } else if ([act isEqual:@"down"]) {
        self.y--;
    } else if ([act isEqual:@"left"]) {
        self.x--;
    } else {
        self.x++;
    }
}

@end
