//
//  Doctor.h
//  lesson3
//
//  Created by Nick on 31/12/2023.
//

#import <Foundation/Foundation.h>
#import "DoctorDelegate.h"
#import "Patient.h"

NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject

@property (nonatomic, weak, nullable) id<DoctorDelegate> delegate;
- (void) setMedicine;

@end

NS_ASSUME_NONNULL_END
