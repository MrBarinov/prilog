//
//  main.m
//  lesson1
//
//  Created by Nick on 27/12/2023.
//

#import <Foundation/Foundation.h>

int descriminant(int a, int b, int c) {
    return b * b - 4 * a * c;
}

NSArray *sqrtEquation(int a, int b, int c) {
    int desc = descriminant(a, b, c);
    if (desc < 0) {
        return @[];
    } else {
        return [NSArray arrayWithObjects:@((-b + sqrt(desc)) / 2 * a), @((-b - sqrt(desc))/ 2 * a), nil];
    }
}

int maxNum(int a, int b, int c) {
    int max = a;
    if (max < b) {
        max = b;
    }
    if (max < c) {
        max = c;
    }
    return  max;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a, b, c;
        scanf("%d", &a);
        scanf("%d", &b);
        scanf("%d", &c);
        NSArray *arr = sqrtEquation(a, b, c);
        if ([arr count] == 0) {
            NSLog(@"Нет корней");
        }
        int i = 1;
        for (NSNumber *num in arr) {
            NSLog(@"x%i = %f", i, [num floatValue]);
            i++;
        }
        NSLog(@"Из чисел %i, %i, %i самое большое - %i", a, b, c, maxNum(a, b, c));
    }
    return 0;
}
