//
//  Circle.h
//  lesson2
//
//  Created by Nick on 30/12/2023.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Circle : Figure {
    @private NSInteger _radius;
}

- (instancetype)initCircle:(NSInteger)raduis;
- (NSInteger)square;
- (NSInteger)perimeter;

@end

NS_ASSUME_NONNULL_END
