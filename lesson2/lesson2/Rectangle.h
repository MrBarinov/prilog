//
//  Rectangle.h
//  lesson2
//
//  Created by Nick on 30/12/2023.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : Figure {
    @private NSInteger _width;
    @private NSInteger _height;
}

- (instancetype)initRect:(NSInteger)width height:(NSInteger)height;
- (NSInteger)square;
- (NSInteger)perimeter;

@end

NS_ASSUME_NONNULL_END
