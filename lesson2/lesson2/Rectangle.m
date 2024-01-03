//
//  Rectangle.m
//  lesson2
//
//  Created by Nick on 30/12/2023.
//

#import "Rectangle.h"

@implementation Rectangle

- (instancetype)initRect:(NSInteger)width height:(NSInteger)height {
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
    }
    return self;
}

- (NSInteger)square {
    return _width * _height;
}

- (NSInteger)perimeter {
    return 2 * _width + 2 * _height;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Ширина = %li, Высота = %li, Площадь = %li, Периметр = %li", _width, _height, [self square], [self perimeter]];
}

@end
