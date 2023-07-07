//
//  AppDelegate.m
//  dekideks-w5p2-20220804-profileUser
//
//  Created by Dekideks on 8/4/22.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.nav = [[UINavigationController alloc] init];
    self.vc1 = [[ViewController alloc]init];

    self.nav.navigationBarHidden = YES;

    [self.nav addChildViewController:self.vc1];
    [self.window setRootViewController:self.nav];
    [self.window makeKeyAndVisible];
    return YES;
}




@end
