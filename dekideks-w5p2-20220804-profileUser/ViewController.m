//
//  ViewController.m
//  dekideks-w5p2-20220804-profileUser
//
//  Created by Dekideks on 8/4/22.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    RegisterViewController * view = [[RegisterViewController alloc]init];
//    view = [[LoginViewController alloc]init];
//    view = [[ProfileViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    

}


@end
