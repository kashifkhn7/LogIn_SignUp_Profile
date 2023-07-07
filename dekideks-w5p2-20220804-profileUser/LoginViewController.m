//
//  LoginViewController.m
//  dekideks-w5p2-20220804-profileUser
//
//  Created by Dekideks on 8/4/22.
//

#import "LoginViewController.h"
#import <Masonry/Masonry.h>
#import "User.h"
#import "ProfileViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIView * formContainer;
@property (nonatomic, strong) UILabel * loginLabel;

@property (nonatomic, strong) UIView * fieldContainer;

@property (nonatomic, strong) UIView * emailFieldView;
@property (nonatomic, strong) UITextField * emailField;
@property (nonatomic, strong) UILabel * emailFieldError;

@property (nonatomic, strong) UIView * passwordFieldView;
@property (nonatomic, strong) UILabel * passwordFieldError;
@property (nonatomic, strong) UITextField * passwordField;

@property (nonatomic, strong) UIView * registerButtonView;
@property (nonatomic, strong) UIButton * registerButton;

@property (nonatomic, strong) UIView * backButtonView;
@property (nonatomic, strong) UIButton * backButton;

@end

@implementation LoginViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpComponents];
    [self setUpConstraints];
}

#pragma mark - Components
- (void)setUpComponents{
    [self.view addSubview:self.formContainer];
    [_formContainer addSubview:self.loginLabel];
    [_formContainer addSubview:self.fieldContainer];
    
    [_fieldContainer addSubview:self.emailFieldView];
    [_emailFieldView addSubview:self.emailFieldError];
    [_emailFieldView addSubview:self.emailField];
    
    [_fieldContainer addSubview:self.passwordFieldView];
    [_passwordFieldView addSubview:self.passwordFieldError];
    [_passwordFieldView addSubview:self.passwordField];
    
    [_fieldContainer addSubview:self.registerButtonView];
    [_registerButtonView addSubview:self.registerButton];
    
    [_fieldContainer addSubview:self.backButtonView];
    [_backButtonView addSubview:self.backButton];
}
- (UIView *)registerButtonView{
    if (!_registerButtonView){
        _registerButtonView = [[UIView alloc]init];
        //        _registerButtonView.backgroundColor = [UIColor clearColor];
    }
    return _registerButtonView;
}

- (UIButton *)registerButton{
    if (!_registerButton){
        _registerButton = [[UIButton alloc]init];
        _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _registerButton.titleLabel.font = [_registerButton.titleLabel.font fontWithSize:20];
        _registerButton.layer.borderWidth = 0.2;
        _registerButton.layer.cornerRadius = 10;
        [_registerButton setTitle:@"Login" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerButton.backgroundColor = [UIColor blueColor];
        [_registerButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UIView *)backButtonView{
    if (!_backButtonView){
        _backButtonView = [[UIView alloc]init];
        //        _registerButtonView.backgroundColor = [UIColor clearColor];
    }
    return _backButtonView;
}

- (UIButton *)backButton{
    if (!_backButton){
        _backButton = [[UIButton alloc]init];
        _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _backButton.titleLabel.font = [_registerButton.titleLabel.font fontWithSize:20];
        _backButton.layer.borderWidth = 0.2;
        _backButton.layer.cornerRadius = 10;
        [_backButton setTitle:@"Back" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _backButton.backgroundColor = [UIColor blueColor];
        [_backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UITextField *) passwordField{
    if (!_passwordField){
        _passwordField = [[UITextField alloc]init];
        _passwordField.layer.borderWidth = 0.2f;
        _passwordField.layer.cornerRadius = 10;
        _passwordField.placeholder = @"Password";
        _passwordField.textAlignment = NSTextAlignmentCenter;
        _passwordField.textColor = [UIColor blackColor];
        _passwordField.backgroundColor = [UIColor whiteColor];
        _passwordField.secureTextEntry = YES;
    }
    return _passwordField;
}
- (UILabel *)passwordFieldError {
    if (!_passwordFieldError) {
        _passwordFieldError = [[UILabel alloc]init];
        _passwordFieldError.text = @"";
        _passwordFieldError.textColor = [UIColor redColor];
        //        _passwordFieldError.font = [_passwordFieldError.font fontWithSize:30];
        _passwordFieldError.font = [UIFont systemFontOfSize:10];
        _passwordFieldError.textAlignment = NSTextAlignmentCenter;
        //        _passwordFieldError.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _passwordFieldError.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _passwordFieldError.font = [UIFont italicSystemFontOfSize:15];
        //        _passwordFieldError.backgroundColor = [UIColor blackColor];
    }
    return _passwordFieldError;
}
- (UIView *)passwordFieldView{
    if (!_passwordFieldView){
        _passwordFieldView = [[UIView alloc]init];
        _passwordFieldView.backgroundColor = [UIColor clearColor];
    }
    return _passwordFieldView;
}

- (UILabel *)emailFieldError {
    if (!_emailFieldError) {
        _emailFieldError = [[UILabel alloc]init];
        _emailFieldError.text = @"";
        _emailFieldError.textColor = [UIColor redColor];
        //        _emailFieldError.font = [_emailFieldError.font fontWithSize:30];
        _emailFieldError.font = [UIFont systemFontOfSize:10];
        _emailFieldError.textAlignment = NSTextAlignmentCenter;
        //        _emailFieldError.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _emailFieldError.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _emailFieldError.font = [UIFont italicSystemFontOfSize:15];
        //        _emailFieldError.backgroundColor = [UIColor blackColor];
    }
    return _emailFieldError;
}
- (UITextField *) emailField{
    if (!_emailField){
        _emailField = [[UITextField alloc]init];
        _emailField.layer.borderWidth = 0.2f;
        _emailField.layer.cornerRadius = 10;
        _emailField.placeholder = @"Email address";
        _emailField.textAlignment = NSTextAlignmentCenter;
        _emailField.textColor = [UIColor blackColor];
        _emailField.backgroundColor = [UIColor whiteColor];
    }
    return _emailField;
}

- (UIView *)emailFieldView{
    if (!_emailFieldView){
        _emailFieldView = [[UIView alloc]init];
        _emailFieldView.backgroundColor = [UIColor clearColor];
    }
    return _emailFieldView;
}

- (UIView *)fieldContainer{
    if (!_fieldContainer){
        _fieldContainer = [[UIView alloc]init];
        //        _fieldContainer.backgroundColor = [UIColor blueColor];
    }
    return _fieldContainer;
}

- (UILabel *)loginLabel {
    if (!_loginLabel) {
        _loginLabel = [[UILabel alloc]init];
        _loginLabel.text = @"LOG IN";
        _loginLabel.textColor = [UIColor whiteColor];
        //        _loginLabel.font = [_loginLabel.font fontWithSize:30];
        _loginLabel.font = [UIFont systemFontOfSize:30];
        _loginLabel.textAlignment = NSTextAlignmentCenter;
        //        _loginLabel.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _loginLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _loginLabel.font = [UIFont italicSystemFontOfSize:15];
        _loginLabel.layer.cornerRadius = 10;
        _loginLabel.layer.borderColor = [UIColor greenColor].CGColor;
        _loginLabel.layer.borderWidth = 1;
        
    }
    return _loginLabel;
}



- (UIView *)formContainer{
    if (!_formContainer){
        _formContainer = [[UIView alloc]init];
        _formContainer.backgroundColor = [UIColor blackColor];
    }
    return _formContainer;
}

#pragma mark - Constraints
- (void)setUpConstraints{
    [_formContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(self.view);
    }];
    [_loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(40);
    }];
    
    [_fieldContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_loginLabel.mas_bottom).offset(40);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.8);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
    
    // field views
    NSArray * fieldViewArray = @[_emailFieldView, _passwordFieldView, _registerButtonView, _backButtonView];
    [fieldViewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:0 tailSpacing:0];
    [fieldViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_fieldContainer.mas_centerX);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(60);
    }];
    for ( UIView * view in fieldViewArray){
        if ([view.subviews count] > 1){
            
            UILabel * label = view.subviews[0];
            UITextField * field = view.subviews[1];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(10);
            }];
            [field mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(label.mas_bottom).offset(5);
            }];
        }
    }
    
    NSArray * fieldArrayError = @[_emailFieldError, _passwordFieldError];
    [fieldArrayError mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_fieldContainer.mas_centerX);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(10);
    }];
    
    NSArray * fieldArray = @[_emailField, _passwordField, _registerButton, _backButton];
    
    [fieldArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_fieldContainer.mas_centerX);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(40);
    }];
    
    
}
#pragma mark - Actions
- (void)loginAction:(UIButton*)sender{
    
    NSArray * fields = @[_emailField, _passwordField];
    NSArray * fieldsError = @[_emailFieldError, _passwordFieldError];
    
    // empty error fields
    for (UILabel * label in fieldsError){
        label.text = @"";
    }
    
    // check if email is valid
    if (![User isEmailValid:_emailField.text]){
        _emailFieldError.text = @"Invalid email.";
    }
    
    // check if fields are empty
    int i = 0;
    int emptyCounter = 0;
    for (UITextField * field in fields){
        
        if ([field.text isEqualToString:@""]){
            ((UILabel *)[fieldsError objectAtIndex:i]).text = @"This field is required";
            emptyCounter++;
        }
        
        i++;
    }
    if (emptyCounter)
        return;
    
    // check if user is existing, if not return
    if (![User isUserExisting:_emailField.text]){
        _emailFieldError.text = @"Email is not registered.";
        return;
    }
    
    // check if password matched user exists
    NSDictionary * user = [User findUserByEmail:_emailField.text];
    NSString * passwordEntered = _passwordField.text;
    NSString * passwordStored = [user objectForKey:@"password"];
    
    NSLog(@"%@", passwordEntered);
    NSLog(@"%@", passwordStored);
    
    if (![passwordEntered isEqualToString: passwordStored]){
        _passwordFieldError.text = @"Incorrect password";
        NSLog(@"he");
        return;
    }
    
    ProfileViewController * profileViewController = [[ProfileViewController alloc]init];
    profileViewController.userEmail = [user objectForKey:@"email"];
    [self.navigationController pushViewController:profileViewController animated:YES];
    
    
}

- (void)backAction:(UIButton*)sender{
    RegisterViewController * registerViewController = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

@end
