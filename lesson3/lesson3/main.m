//
//  main.m
//  lesson3
//
//  Created by Nick on 31/12/2023.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Doctor *doc = [Doctor new];
        Patient *patient = [Patient new];
        
        doc.delegate = patient;
        [doc setMedicine];
    }
    return 0;
}
