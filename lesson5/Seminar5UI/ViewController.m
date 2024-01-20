//
//  ViewController.m
//  Seminar5UI
//
//  Created by Nick on 20/01/2024.
//

#import "ViewController.h"
#import "PostViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
    
    UIBarButtonItem *postReqButton = [[UIBarButtonItem alloc] initWithTitle:@"Post request" style:UIBarButtonItemStylePlain target:self action:@selector(goToPostRequest)];
    self.navigationItem.rightBarButtonItem = postReqButton;
    self.resultLabel.numberOfLines = 30;
}

- (void)setupViews {
    self.resultLabel = [[UILabel alloc] init];
    [self.view addSubview:self.resultLabel];
    [self setupConstraints];
}

- (void)setupConstraints {
    self.resultLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.resultLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.resultLabel.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant: 10],
        [self.resultLabel.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant: -10],
        [self.resultLabel.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant: -20]
    ]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self performLoadingForGetRequest];
//    [self performLoadingForPostRequest];
}

- (void)performLoadingForGetRequest {
    [self.loader performGetRequestFromURL:@"https://postman-echo.com/get" arguments:@{@"var1": @"first", @"var2": @"second"} block:^(NSDictionary *dictionary, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSString *resultString = [NSString stringWithFormat:@"%@", error];
                self.resultLabel.text = resultString;
                self.resultLabel.textColor = [UIColor redColor];
//                NSLog(@"Error: %@", error);
                return;
            }
            NSString *resultString = [NSString stringWithFormat:@"%@", dictionary];
            self.resultLabel.text = resultString;
            self.resultLabel.textColor = [UIColor blackColor];
//            NSLog(@"%@", resultString);
        });
    }];
}

- (void)goToPostRequest {
    PostViewController *postViewController = [[PostViewController alloc] init];
    [self.navigationController pushViewController:postViewController animated:YES];
}

@end
