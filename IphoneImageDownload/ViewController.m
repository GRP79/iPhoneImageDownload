//
//  ViewController.m
//  IphoneImageDownload
//
//  Created by sd79 on 2017-06-19
//  Copyright © 2017 Glen Posey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iPhoneImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    


}
- (IBAction)randomImageButton:(UIButton *)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://imgur.com/2vQtZBb.png"];
    NSURL *url1 = [NSURL URLWithString:@"http://imgur.com/zdwdenZ.png"];
    NSURL *url2 = [NSURL URLWithString:@"http://imgur.com/y9MIaCS.png"];
    NSURL *url3 = [NSURL URLWithString:@"http://imgur.com/CoQ8aNl.png"];
    NSURL *url4 = [NSURL URLWithString:@"http://imgur.com/bktnImE.png"];
    
    self.imagesArray = [NSArray arrayWithObjects:url, url1, url2, url3, url4, nil];

    
//   for (int i = 0; i < self.imagesArray.count; i++) {
    
       int i =arc4random()% ([_imagesArray count]);
    NSURL *randomURL = [self.imagesArray objectAtIndex:i];
    
    NSLog(@"number %@", @(i));
    
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *downLoadTask = [session downloadTaskWithURL:randomURL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (error) {
                NSLog(@"error: %@", error.localizedDescription);
                return;
            }
            
            NSData *data = [NSData dataWithContentsOfURL:location];
            UIImage *image = [UIImage imageWithData:data];
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                self.iPhoneImageView.image = image;
                
                
            }];
            
            
        }];
        
        [downLoadTask resume];
        
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
