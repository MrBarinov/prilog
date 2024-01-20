//
//  Loader.m
//  Seminar5
//
//  Created by Nick on 20/01/2024.
//

#import "Loader.h"

@implementation Loader

- (NSURLSession *) session {
    if (!_session) {
        NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
        conf.HTTPAdditionalHeaders = @{@"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       @"User-Agent": @"iPhone 15 Pro Max Simulator iOS 17.2"};
        _session = [NSURLSession sessionWithConfiguration:conf];
    }
    return _session;
}

- (void)performGetRequestFromURL:(NSString *)stringUrl arguments:(NSDictionary *)arguments block:(void (^)(NSDictionary *, NSError *))block {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:stringUrl];
    if (arguments) {
        NSMutableArray<NSURLQueryItem*> *queryItems = [NSMutableArray new];
        for (NSString *key in arguments.allKeys) {
            [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:arguments[key]]];
        }
        urlComponents.queryItems = [queryItems copy];
    }
    NSURL *url = urlComponents.URL;
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
            return;
        }
        NSError *parsingError;
        NSDictionary *dict = [self parseJSONData:data error:&parsingError];
        if (parsingError) {
            block(nil, parsingError);
            return;
        }
        block(dict, nil);
    }];
    [task resume];
}

- (void)performPostRequestFromURL:(NSString *)stringUrl arguments:(NSDictionary *)arguments block:(void (^)(NSDictionary *, NSError *))block {
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    if (arguments) {
        NSData *data = [self dataFromJSON:arguments error:nil];
        request.HTTPBody = data;
    }
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
            return;
        }
        NSError *parsingError;
        NSDictionary *dict = [self parseJSONData:data error:&parsingError];
        if (parsingError) {
            block(nil, parsingError);
            return;
        }
        block(dict, nil);
    }];
    [task resume];
}

- (NSData *)dataFromJSON:(NSDictionary *)JSONDict error:(NSError **)error {
    return [NSJSONSerialization dataWithJSONObject:JSONDict options:kNilOptions error:error];
}

- (NSDictionary *)parseJSONData:(NSData *)data error:(NSError **)error {
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];
}

@end
