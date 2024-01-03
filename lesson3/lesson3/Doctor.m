//
//  Doctor.m
//  lesson3
//
//  Created by Nick on 31/12/2023.
//

#import "Doctor.h"

@implementation Doctor

- (void)setMedicine {
    NSLog(@"Doctor set medicine to pacient");
    [self.delegate getMedicine];
}

@end
