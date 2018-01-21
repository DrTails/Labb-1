//
//  GameViewController.m
//  Labb 1
//
//  Created by Daniel Martinsson on 2018-01-21.
//  Copyright © 2018 Daniel Martinsson. All rights reserved.
//

#import "GameViewController.h"
#import "ColorViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *sliderValueText;
@property (weak, nonatomic) IBOutlet UISlider *sliderValue;
@property (weak, nonatomic) IBOutlet UILabel *rightOrWrong;
@property (nonatomic) int randomNumber;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setRandomNumber];
}

-(void)setRandomNumber {
 self.randomNumber = arc4random_uniform(100)+1;
}

- (IBAction)sliderNumberValue:(id)sender {
    self.sliderValueText.text = [NSString stringWithFormat:@"%.f", self.sliderValue.value];
}

- (IBAction)guessButton:(id)sender {
    NSInteger guessedNumber = self.sliderValue.value;
    if (guessedNumber == _randomNumber) {
        self.rightOrWrong.text = @"Rätt! Grattis! Försök igen!";
        [self setRandomNumber];
    } else if (guessedNumber < _randomNumber) {
        self.rightOrWrong.text = @"För lågt!";
    } else {
        self.rightOrWrong.text = @"För högt!";
    }
    
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
