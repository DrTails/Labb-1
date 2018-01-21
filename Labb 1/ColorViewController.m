//
//  ColorViewController.m
//  Labb 1
//
//  Created by Daniel Martinsson on 2018-01-20.
//  Copyright © 2018 Daniel Martinsson. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()
@property (weak, nonatomic) IBOutlet UISlider *red;
@property (weak, nonatomic) IBOutlet UISlider *green;
@property (weak, nonatomic) IBOutlet UISlider *blue;

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)sliders:(id)sender {
    [self colorChanged];
}

-(void)colorChanged {
    self.view.backgroundColor = [self currentColor];
}

-(UIColor*) currentColor {
    return [UIColor colorWithRed:self.red.value
        green:self.green.value
        blue:self.blue.value
        alpha:1.0f];
}

- (IBAction)colorSaved:(id)sender {
    [[NSUserDefaults standardUserDefaults] setFloat:self.red.value forKey:@"redColorValue"];
    [[NSUserDefaults standardUserDefaults] setFloat:self.green.value forKey:@"greenColorValue"];
    [[NSUserDefaults standardUserDefaults] setFloat:self.blue.value forKey:@"blueColorValue"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}

+(UIColor*) loadSavedColor {
    float red = [[NSUserDefaults standardUserDefaults]floatForKey:@"redColorValue"];
    float green = [[NSUserDefaults standardUserDefaults]floatForKey:@"greenColorValue"];
    float blue = [[NSUserDefaults standardUserDefaults]floatForKey:@"blueColorValue"];
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

-(void) viewWillAppear:(BOOL)animated {
    float red = [[NSUserDefaults standardUserDefaults]floatForKey:@"redColorValue"];
    float green = [[NSUserDefaults standardUserDefaults]floatForKey:@"greenColorValue"];
    float blue = [[NSUserDefaults standardUserDefaults]floatForKey:@"blueColorValue"];
    self.red.value = red;
    self.green.value = green;
    self.blue.value = blue;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
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
