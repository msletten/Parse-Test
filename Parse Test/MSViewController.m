//
//  MSViewController.m
//  Parse Test
//
//  Created by Mat Sletten on 5/30/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import "MSViewController.h"

@interface MSViewController ()

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(UIButton *)sender
{
    //Each PFObject contains key-value pairs of JSON-compatible data. This data is schemaless, which means that you don't need to specify ahead of time what keys exist on each PFObject. You simply set whatever key-value pairs you want, and our backend will store it. Things we can store - strings, numbers, booleans, or even arrays and dictionaries. When creating class names always use capital letters for keys always use lower case letters.
    PFObject *loginCredentials = [PFObject objectWithClassName:@"LoginCredentials"];
    loginCredentials[@"name"] = self.usernameTextField.text;
    loginCredentials[@"password"] = self.passwordTextField.text;
    //saveInBackground: saves the object asychronously so as to not block the UI while the user presses other buttons.
    [loginCredentials saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if (succeeded)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Save" message:@"Your object saved" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alertView show];
            NSLog(@"save great success!");
        }
        else if(error)
        {
            NSLog(@"%@", error);
        }
    }];
}


@end
