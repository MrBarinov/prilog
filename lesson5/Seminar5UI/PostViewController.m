//
//  GetViewController.m
//  Seminar5UI
//
//  Created by Nick on 20/01/2024.
//

#import "PostViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
    
    UIBarButtonItem *getReqButton = [[UIBarButtonItem alloc] initWithTitle:@"Get request" style:UIBarButtonItemStylePlain target:self action:@selector(goToGetRequest)];
    self.navigationItem.leftBarButtonItem = getReqButton;
    self.resultLabel.numberOfLines = 30;
    
    [self.send addTarget:self action:@selector(sendPostRequest) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupViews {
    self.var1 = [[UITextField alloc] init];
    self.var1.placeholder = @"Первый параметр";
    [self.view addSubview: self.var1];
    self.var2 = [[UITextField alloc] init];
    self.var2.placeholder = @"Второй параметр";
    [self.view addSubview: self.var2];
    self.send = [[UIButton alloc] init];
    [self.send setTitle:@"Отправить запрос" forState:normal];
    [self.send setTitleColor:[UIColor blackColor] forState:normal];
    self.send.layer.borderWidth = 1;
    self.send.layer.cornerRadius = 10;
    self.send.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view addSubview: self.send];
    self.resultLabel = [[UILabel alloc] init];
    [self.view addSubview: self.resultLabel];
    [self setupConstraints];
}

- (void)setupConstraints {
    self.var1.translatesAutoresizingMaskIntoConstraints = NO;
    self.var2.translatesAutoresizingMaskIntoConstraints = NO;
    self.send.translatesAutoresizingMaskIntoConstraints = NO;
    self.resultLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.var1.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.var1.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.var1.widthAnchor constraintEqualToConstant:200],
        [self.var1.heightAnchor constraintEqualToConstant:40],
        
        [self.var2.topAnchor constraintEqualToAnchor:self.var1.bottomAnchor constant:10],
        [self.var2.centerXAnchor constraintEqualToAnchor: self.var1.centerXAnchor],
        [self.var2.widthAnchor constraintEqualToAnchor:self.var1.widthAnchor],
        [self.var2.heightAnchor constraintEqualToAnchor:self.var1.heightAnchor],
        
        [self.send.topAnchor constraintEqualToAnchor:self.var2.bottomAnchor constant:10],
        [self.send.centerXAnchor constraintEqualToAnchor: self.var2.centerXAnchor],
        [self.send.widthAnchor constraintEqualToAnchor:self.var2.widthAnchor],
        [self.send.heightAnchor constraintEqualToAnchor:self.var2.heightAnchor],
        
        [self.resultLabel.topAnchor constraintEqualToAnchor:self.send.bottomAnchor constant:10],
        [self.resultLabel.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant: 10],
        [self.resultLabel.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant: -10],
        [self.resultLabel.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant: -20]
    ]];
}

- (void)sendPostRequest {
    NSString *var1 = self.var1.text;
    NSString *var2 = self.var2.text;
    
    [self performLoadingForPostRequest:var1 var2:var2];
}

- (void)performLoadingForPostRequest: (NSString*)var1
                                var2: (NSString*)var2 {
    [self.loader performPostRequestFromURL:@"https://postman-echo.com/post" arguments:@{@"var1": var1, @"var2": var2} block:^(NSDictionary *dictionary, NSError *error) {
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
//            NSLog(@"%@", dictionary);
        });
    }];
}

- (void)goToGetRequest {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
