//
//  ParentViewController.m
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/2/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "ParentViewController.h"

@interface ParentViewController ()

@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUp {
    UIBarButtonItem *btnMenu = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Menu", nil)
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(tappedAtMenuButton:)];
    self.navigationController.navigationItem.leftBarButtonItem = btnMenu;
}

- (void)tappedAtMenuButton:(id)sender {
    
}

@end
