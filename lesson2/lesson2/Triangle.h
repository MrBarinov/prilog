//
//  Triangle.h
//  lesson2
//
//  Created by Nick on 30/12/2023.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Triangle : Figure {
    @private NSInteger _side1;
    @private NSInteger _side2;
    @private NSInteger _side3;
}

- (instancetype)initTria:(NSInteger)a b:(NSInteger)b c:(NSInteger)c;
- (NSInteger)square;
- (NSInteger)perimeter;

@end

NS_ASSUME_NONNULL_END
