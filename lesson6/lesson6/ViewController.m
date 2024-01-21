//
//  ViewController.m
//  Seminar5UI
//
//  Created by Nick on 20/01/2024.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    self.fileManager = [NSFileManager defaultManager];
    self.robot = [[Robot alloc] init];
    [self setupViews];
    [self.saveToUD addTarget:self action:@selector(saveToUserDefaults) forControlEvents:UIControlEventTouchUpInside];
    [self.saveToFile addTarget:self action:@selector(saveToFileFunc) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupViews {
    self.x = [[UITextField alloc] init];
    self.x.placeholder = @"Координата x";
    [self.view addSubview: self.x];
    self.y = [[UITextField alloc] init];
    self.y.placeholder = @"Координата y";
    [self.view addSubview: self.y];
    self.name = [[UITextField alloc] init];
    self.name.placeholder = @"Название робота";
    [self.view addSubview: self.name];
    self.saveToUD = [[UIButton alloc] init];
    [self.saveToUD setTitle:@"Сохранить в настройки" forState:normal];
    [self.saveToUD setTitleColor:[UIColor blackColor] forState:normal];
    self.saveToUD.layer.borderWidth = 1;
    self.saveToUD.layer.cornerRadius = 10;
    self.saveToUD.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view addSubview: self.saveToUD];
    self.saveToFile = [[UIButton alloc] init];
    [self.saveToFile setTitle:@"Сохранить в файл" forState:normal];
    [self.saveToFile setTitleColor:[UIColor blackColor] forState:normal];
    self.saveToFile.layer.borderWidth = 1;
    self.saveToFile.layer.cornerRadius = 10;
    self.saveToFile.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view addSubview: self.saveToFile];
    self.text = [[UITextView alloc] init];
    self.text.font = [UIFont systemFontOfSize:20];
    [self.view addSubview: self.text];
    [self setupConstraints];
}

- (void)setupConstraints {
    self.x.translatesAutoresizingMaskIntoConstraints = NO;
    self.y.translatesAutoresizingMaskIntoConstraints = NO;
    self.name.translatesAutoresizingMaskIntoConstraints = NO;
    self.saveToUD.translatesAutoresizingMaskIntoConstraints = NO;
    self.saveToFile.translatesAutoresizingMaskIntoConstraints = NO;
    self.text.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.x.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.x.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.x.widthAnchor constraintEqualToConstant:200],
        [self.x.heightAnchor constraintEqualToConstant:40],
        
        [self.y.topAnchor constraintEqualToAnchor:self.x.bottomAnchor constant:10],
        [self.y.centerXAnchor constraintEqualToAnchor: self.x.centerXAnchor],
        [self.y.widthAnchor constraintEqualToAnchor:self.x.widthAnchor],
        [self.y.heightAnchor constraintEqualToAnchor:self.x.heightAnchor],
        
        [self.name.topAnchor constraintEqualToAnchor:self.y.bottomAnchor constant:10],
        [self.name.centerXAnchor constraintEqualToAnchor: self.y.centerXAnchor],
        [self.name.widthAnchor constraintEqualToAnchor:self.y.widthAnchor],
        [self.name.heightAnchor constraintEqualToAnchor:self.y.heightAnchor],
        
        [self.saveToUD.topAnchor constraintEqualToAnchor:self.name.bottomAnchor constant:10],
        [self.saveToUD.centerXAnchor constraintEqualToAnchor: self.name.centerXAnchor],
        [self.saveToUD.widthAnchor constraintEqualToAnchor:self.name.widthAnchor],
        [self.saveToUD.heightAnchor constraintEqualToAnchor:self.name.heightAnchor],
        
        [self.saveToFile.topAnchor constraintEqualToAnchor:self.saveToUD.bottomAnchor constant:10],
        [self.saveToFile.centerXAnchor constraintEqualToAnchor: self.saveToUD.centerXAnchor],
        [self.saveToFile.widthAnchor constraintEqualToAnchor:self.saveToUD.widthAnchor],
        [self.saveToFile.heightAnchor constraintEqualToAnchor:self.saveToUD.heightAnchor],
        
        [self.text.topAnchor constraintEqualToAnchor:self.saveToFile.bottomAnchor constant:10],
        [self.text.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant: 10],
        [self.text.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant: -10],
        [self.text.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant: -20]
    ]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)saveToUserDefaults {
    int x = [self.x.text intValue];
    int y = [self.y.text intValue];
    NSString *name = self.name.text;
    self.robot.x = x;
    self.robot.y = y;
    self.robot.name = name;
    [self.userDefaults setInteger:x forKey:@"x"];
    [self.userDefaults setInteger:y forKey:@"y"];
    [self.userDefaults setObject:name forKey:@"name"];
    [self readFromUserDefaults];
}

- (void)readFromUserDefaults {
    NSString *name = [self.userDefaults stringForKey:@"name"];
    NSInteger x = [self.userDefaults integerForKey:@"x"];
    NSInteger y = [self.userDefaults integerForKey:@"y"];
    self.text.text = [NSString stringWithFormat:@"Название: %@\nКоординаты: (%li, %li)", name, x, y];
    self.robot.x = (int)x;
    self.robot.y = (int)y;
    self.robot.name = name;
}

- (void)saveToFileFunc {
    int x = [self.x.text intValue];
    int y = [self.y.text intValue];
    NSString *name = self.name.text;
    NSURL *path = [self.fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *folderPath = [path URLByAppendingPathComponent:@"Robot"];
    NSURL *dataPath = [folderPath URLByAppendingPathComponent:@"data.txt"];
    NSData *data = [[NSString stringWithFormat:@"%@\n%i\n%i", name, x, y] dataUsingEncoding:kCFStringEncodingUTF8];
    if ([self.fileManager createDirectoryAtURL:folderPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        [self.fileManager createFileAtPath:dataPath.path contents:data attributes:nil];
    }
    [self readFromFile:dataPath];
}

- (void)readFromFile:(NSURL*)dataPath {
    if ([self.fileManager fileExistsAtPath:dataPath.path]) {
        NSData *read = [self.fileManager contentsAtPath:dataPath.path];
        NSString *str = [[NSString alloc] initWithData:read encoding:kCFStringEncodingUTF8];
        NSArray *params = [str componentsSeparatedByString:@"\n"];
        NSString *result = [NSString stringWithFormat:@"Название: %@\nКоординаты: (%i, %i)", params[0], [params[1] intValue], [params[2] intValue]];
        self.text.text = result;
        self.robot.x = [params[1] intValue];
        self.robot.y = [params[2] intValue];
        self.robot.name = params[0];
    }
}

@end
