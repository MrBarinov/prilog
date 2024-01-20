//
//  ViewController.h
//  Seminar5UI
//
//  Created by Nick on 20/01/2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"


@interface ViewController : UIViewController

@property (nonatomic, strong) Loader *loader;
@property (nonatomic, strong) IBOutlet UILabel *resultLabel;

@end

