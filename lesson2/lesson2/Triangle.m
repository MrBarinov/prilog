//
//  Triangle.m
//  lesson2
//
//  Created by Nick on 30/12/2023.
//

#import "Triangle.h"

@implementation Triangle

- (instancetype)initTria:(NSInteger)a b:(NSInteger)b c:(NSInteger)c {
    self = [super init];
    if (self) {
        _side1 = a;
        _side2 = b;
        _side3 = c;
    }
    return self;
}

- (NSInteger)square {
    double s = (double)[self perimeter] / 2;
    return sqrt(s * (s - _side1) * (s - _side2) * (s - _side3));
}

- (NSInteger)perimeter {
    return _side1 + _side2 + _side3;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"a = %li, b = %li, c = %li, Площадь = %li, Периметр = %li", _side1, _side2, _side3, [self square], [self perimeter]];
}

@end
