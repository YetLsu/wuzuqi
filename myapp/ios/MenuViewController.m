//
//  MenuViewController.m
//  myapp
//
//  Created by jason.cao on 2018/4/2.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"
#import "RnViewController.h"

@interface MenuViewController ()
@property (nonatomic, strong) UIActivityIndicatorView *actiview;
@end

@implementation MenuViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setupContent];
  [self setupChildVC];
  [self requestData];
  
  
  
}
- (void)setupChildVC{
  GameViewController *vc = [[GameViewController alloc] init];
  [self addChildViewController:vc];
}
- (void)requestData{
  NSURLSession *session = [NSURLSession sharedSession];
  [[session dataTaskWithURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/YetLsu/api/master/conf"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
      NSLog(@"------------%@---------",error);
    }
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%@",dict);
    __block BOOL succ = dict[@"isRN"];
    sleep(3);
    dispatch_async(dispatch_get_main_queue(), ^{
      [_actiview stopAnimating];
      [_actiview removeFromSuperview];
      if (!succ) {
        RnViewController *rn = [[RnViewController alloc] init];
        [self presentViewController:rn animated:NO completion:nil];
      }else{
        NSLog(@"2");
        [self.view addSubview:[self.childViewControllers[0] view]];
      }
      
    });
    
  }] resume];
}


- (void)setupContent{
  
  UIActivityIndicatorView *actiview = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
  actiview.center = self.view.center;
  //    actiview.backgroundColor = [UIColor redColor];
  [actiview startAnimating];
  self.actiview = actiview;
  [self.view addSubview:actiview];
  self.view.backgroundColor = [UIColor grayColor];
  
}


//- (IBAction)game:(UIButton *)sender {
//  GameViewController *game = [[GameViewController alloc] init];
//  [self presentViewController:game animated:NO completion:nil];
//}
//- (IBAction)rnPage:(id)sender {
//  RnViewController *rn = [[RnViewController alloc] init];
// [self presentViewController:rn animated:NO completion:nil];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
