//
//  Circle.m
//  lesson2
//
//  Created by Nick on 30/12/2023.
//

#import "Circle.h"
#include "math.h"

@implementation Circle

- (instancetype)initCircle:(NSInteger)raduis {
    self = [super init];
    if (self) {
        _radius = raduis;
    }
    return self;
}

- (NSInteger)square {
    return M_PI * _radius * _radius;
}

- (NSInteger)perimeter {
    return 2 * M_PI * _radius;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Радиус = %li, Площадь = %li, Периметр = %li", _radius, [self square], [self perimeter]];
}

@end
