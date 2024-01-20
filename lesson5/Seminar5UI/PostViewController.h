//
//  GetViewController.h
//  Seminar5UI
//
//  Created by Nick on 20/01/2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *var1;
@property (nonatomic, strong) IBOutlet UITextField *var2;
@property (nonatomic, strong) IBOutlet UIButton *send;
@property (nonatomic, strong) IBOutlet UILabel *resultLabel;
@property (nonatomic, strong) Loader *loader;

@end

NS_ASSUME_NONNULL_END
