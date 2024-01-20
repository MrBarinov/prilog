//
//  main.m
//  lesson4
//
//  Created by Nick on 12/01/2024.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

typedef NSString*(^actType)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        actType upBlock = ^NSString*() {
            return @"up";
        };
        actType downBlock = ^NSString*() {
            return @"down";
        };
        actType leftBlock = ^NSString*() {
            return @"left";
        };
        actType rightBlock = ^NSString*() {
            return @"right";
        };
        
        Robot *robot = [Robot new];
        [robot run:upBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
        [robot run:upBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
        [robot run:rightBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
        [robot run:upBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
        [robot run:leftBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
        [robot run:leftBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
        [robot run:downBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
        [robot run:leftBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
        [robot run:downBlock];
        NSLog(@"x = %d, y = %d", robot.x, robot.y);
    }
    return 0;
}
