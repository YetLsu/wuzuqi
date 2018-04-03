//
//  RnViewController.m
//  myapp
//
//  Created by jason.cao on 2018/4/2.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "RnViewController.h"

#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface RnViewController ()

@end

@implementation RnViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  [self setupContent];
}

- (void)setupContent{
  NSURL *jsCodeLocation;
  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"myapp" initialProperties:nil launchOptions: nil];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  self.view = rootView;
}


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
