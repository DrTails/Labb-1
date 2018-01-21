//
//  AboutMeViewController.m
//  Labb 1
//
//  Created by Daniel Martinsson on 2018-01-21.
//  Copyright © 2018 Daniel Martinsson. All rights reserved.
//

#import "AboutMeViewController.h"
#import "ColorViewController.h"

@interface AboutMeViewController ()

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [ColorViewController loadSavedColor];
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
