//
//  main.m
//  lesson2
//
//  Created by Nick on 30/12/2023.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Circle.h"
#import "Triangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Rectangle *rec = [[Rectangle alloc] initRect:5 height:7];
        Circle *circle = [[Circle alloc] initCircle:5];
        Triangle *tria = [[Triangle alloc] initTria:5 b:7 c:9];
        NSArray *figures = [NSArray arrayWithObjects:
                            rec,
                            circle,
                            tria,
                            nil];
        
        for (Figure *fig in figures) {
            NSLog(@"%@", fig);
        }
        
    }
    
    return 0;
}
