//
//  ViewController.h
//  Seminar5UI
//
//  Created by Nick on 20/01/2024.
//

#import <UIKit/UIKit.h>
#import "Robot.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *x;
@property (nonatomic, strong) IBOutlet UITextField *y;
@property (nonatomic, strong) IBOutlet UITextField *name;
@property (nonatomic, strong) IBOutlet UIButton *saveToUD;
@property (nonatomic, strong) IBOutlet UIButton *saveToFile;
@property (nonatomic, strong) IBOutlet UITextView *text;

@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (nonatomic, strong) NSFileManager *fileManager;

@property (nonatomic, strong) Robot *robot;

@end

