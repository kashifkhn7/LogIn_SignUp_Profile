//
//  RegisterViewController.m
//  dekideks-w5p2-20220804-profileUser
//
//  Created by Dekideks on 8/4/22.
//

#import "RegisterViewController.h"
#import <Masonry/Masonry.h>
#import "User.h"
#import "LoginViewController.h"

@interface RegisterViewController ()
@property (nonatomic, strong) UIView * formContainer;
@property (nonatomic, strong) UILabel * registerLabel;


@property (nonatomic, strong) UIView * fieldContainer;

@property (nonatomic, strong) UIView * emailFieldView;
@property (nonatomic, strong) UITextField * emailField;
@property (nonatomic, strong) UILabel * emailFieldError;

@property (nonatomic, strong) UIView * passwordFieldView;
@property (nonatomic, strong) UILabel * passwordFieldError;
@property (nonatomic, strong) UITextField * passwordField;

@property (nonatomic, strong) UIView * confirmPasswordFieldView;
@property (nonatomic, strong) UILabel * confirmPasswordFieldError;
@property (nonatomic, strong) UITextField * confirmPasswordField;

@property (nonatomic, strong) UIView * firstNameFieldView;
@property (nonatomic, strong) UILabel * firstNameFieldError;
@property (nonatomic, strong) UITextField * firstNameField;

@property (nonatomic, strong) UIView * lastNameFieldView;
@property (nonatomic, strong) UILabel * lastNameFieldError;
@property (nonatomic, strong) UITextField * lastNameField;

@property (nonatomic, strong) UIView * phoneNumberFieldView;
@property (nonatomic, strong) UILabel * phoneNumberFieldError;
@property (nonatomic, strong) UITextField * phoneNumberField;

@property (nonatomic, strong) UIView * registerButtonView;
@property (nonatomic, strong) UIButton * registerButton;

@property (nonatomic, strong) UIView * logInbuttonView;
@property (nonatomic, strong) UIButton * logInbutton;

@end

@implementation RegisterViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view. backgroundColor = [UIColor clearColor];
    [self setUpComponents];
    [self setUpConstraints];
}

#pragma mark - Components
- (void)setUpComponents{
    [self.view addSubview:self.formContainer];
    [_formContainer addSubview:self.registerLabel];
    [_formContainer addSubview:self.fieldContainer];
    
    [_fieldContainer addSubview:self.emailFieldView];
    [_emailFieldView addSubview:self.emailFieldError];
    [_emailFieldView addSubview:self.emailField];
    
    [_fieldContainer addSubview:self.passwordFieldView];
    [_passwordFieldView addSubview:self.passwordFieldError];
    [_passwordFieldView addSubview:self.passwordField];
    
    [_fieldContainer addSubview:self.confirmPasswordFieldView];
    [_confirmPasswordFieldView addSubview:self.confirmPasswordFieldError];
    [_confirmPasswordFieldView addSubview:self.confirmPasswordField];
    
    [_fieldContainer addSubview:self.firstNameFieldView];
    [_firstNameFieldView addSubview:self.firstNameFieldError];
    [_firstNameFieldView addSubview:self.firstNameField];
    
    
    [_fieldContainer addSubview:self.lastNameFieldView];
    [_lastNameFieldView addSubview:self.lastNameFieldError];
    [_lastNameFieldView addSubview:self.lastNameField];
    
    [_fieldContainer addSubview:self.phoneNumberFieldView];
    [_phoneNumberFieldView addSubview:self.phoneNumberFieldError];
    [_phoneNumberFieldView addSubview:self.phoneNumberField];
    
    [_fieldContainer addSubview:self.registerButtonView];
    [_registerButtonView addSubview:self.registerButton];
    
    [_fieldContainer addSubview:self.logInbuttonView];
    [_logInbuttonView addSubview:self.logInbutton];
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
        [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerButton.backgroundColor = [UIColor blueColor];
        [_registerButton addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UIView *)logInbuttonView{
    if (!_logInbuttonView){
        _logInbuttonView = [[UIView alloc]init];
        //        _registerButtonView.backgroundColor = [UIColor clearColor];
    }
    return _logInbuttonView;
}

- (UIButton *)logInbutton{
    if (!_logInbutton){
        _logInbutton = [[UIButton alloc]init];
        _logInbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _logInbutton.titleLabel.font = [_registerButton.titleLabel.font fontWithSize:20];
        _logInbutton.layer.borderWidth = 0.2;
        _logInbutton.layer.cornerRadius = 10;
        [_logInbutton setTitle:@"Log In" forState:UIControlStateNormal];
        [_logInbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _logInbutton.backgroundColor = [UIColor blueColor];
        [_logInbutton addTarget:self action:@selector(logInAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logInbutton;
}

- (UITextField *) phoneNumberField{
    if (!_phoneNumberField){
        _phoneNumberField = [[UITextField alloc]init];
        _phoneNumberField.layer.borderWidth = 0.2f;
        _phoneNumberField.layer.cornerRadius = 10;
        _phoneNumberField.placeholder = @"Phone Number";
        _phoneNumberField.textAlignment = NSTextAlignmentCenter;
        _phoneNumberField.textColor = [UIColor blackColor];
        _phoneNumberField.backgroundColor = [UIColor whiteColor];
    }
    return _phoneNumberField;
}

- (UILabel *)phoneNumberFieldError {
    if (!_phoneNumberFieldError) {
        _phoneNumberFieldError = [[UILabel alloc]init];
        _phoneNumberFieldError.text = @"";
        _phoneNumberFieldError.textColor = [UIColor redColor];
        //        _phoneNumberFieldError.font = [_phoneNumberFieldError.font fontWithSize:30];
        _phoneNumberFieldError.font = [UIFont systemFontOfSize:10];
        _phoneNumberFieldError.textAlignment = NSTextAlignmentCenter;
        //        _phoneNumberFieldError.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _phoneNumberFieldError.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _phoneNumberFieldError.font = [UIFont italicSystemFontOfSize:15];
        //        _phoneNumberFieldError.backgroundColor = [UIColor blackColor];
    }
    return _phoneNumberFieldError;
    
}
- (UIView *)phoneNumberFieldView{
    if (!_phoneNumberFieldView){
        _phoneNumberFieldView = [[UIView alloc]init];
        _phoneNumberFieldView.backgroundColor = [UIColor clearColor];
    }
    return _phoneNumberFieldView;
}

- (UITextField *) lastNameField{
    if (!_lastNameField){
        _lastNameField = [[UITextField alloc]init];
        _lastNameField.layer.borderWidth = 0.2f;
        _lastNameField.layer.cornerRadius = 10;
        _lastNameField.placeholder = @"Last Name";
        _lastNameField.textAlignment = NSTextAlignmentCenter;
        _lastNameField.textColor = [UIColor blackColor];
        _lastNameField.backgroundColor = [UIColor whiteColor];
    }
    return _lastNameField;
}

- (UILabel *)lastNameFieldError {
    if (!_lastNameFieldError) {
        _lastNameFieldError = [[UILabel alloc]init];
        _lastNameFieldError.text = @"";
        _lastNameFieldError.textColor = [UIColor redColor];
        //        _lastNameFieldError.font = [_lastNameFieldError.font fontWithSize:30];
        _lastNameFieldError.font = [UIFont systemFontOfSize:10];
        _lastNameFieldError.textAlignment = NSTextAlignmentCenter;
        //        _lastNameFieldError.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _lastNameFieldError.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _lastNameFieldError.font = [UIFont italicSystemFontOfSize:15];
        //        _lastNameFieldError.backgroundColor = [UIColor blackColor];
    }
    return _lastNameFieldError;
    
}
- (UIView *)lastNameFieldView{
    if (!_lastNameFieldView){
        _lastNameFieldView = [[UIView alloc]init];
        _lastNameFieldView.backgroundColor = [UIColor clearColor];
    }
    return _lastNameFieldView;
}

- (UITextField *) firstNameField{
    if (!_firstNameField){
        _firstNameField = [[UITextField alloc]init];
        _firstNameField.layer.borderWidth = 0.2f;
        _firstNameField.layer.cornerRadius = 10;
        _firstNameField.placeholder = @"First Name";
        _firstNameField.textAlignment = NSTextAlignmentCenter;
        _firstNameField.textColor = [UIColor blackColor];
        _firstNameField.backgroundColor = [UIColor whiteColor];
    }
    return _firstNameField;
}
- (UILabel *)firstNameFieldError {
    if (!_firstNameFieldError) {
        _firstNameFieldError = [[UILabel alloc]init];
        _firstNameFieldError.text = @"";
        _firstNameFieldError.textColor = [UIColor redColor];
        //        _firstNameFieldError.font = [_firstNameFieldError.font fontWithSize:30];
        _firstNameFieldError.font = [UIFont systemFontOfSize:10];
        _firstNameFieldError.textAlignment = NSTextAlignmentCenter;
        //        _firstNameFieldError.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _firstNameFieldError.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _firstNameFieldError.font = [UIFont italicSystemFontOfSize:15];
        //        _firstNameFieldError.backgroundColor = [UIColor blackColor];
    }
    return _firstNameFieldError;
    
}
- (UIView *)firstNameFieldView{
    if (!_firstNameFieldView){
        _firstNameFieldView = [[UIView alloc]init];
        _firstNameFieldView.backgroundColor = [UIColor clearColor];
    }
    return _firstNameFieldView;
}

- (UITextField *) confirmPasswordField{
    if (!_confirmPasswordField){
        _confirmPasswordField = [[UITextField alloc]init];
        _confirmPasswordField.layer.borderWidth = 0.2f;
        _confirmPasswordField.layer.cornerRadius = 10;
        _confirmPasswordField.placeholder = @"Confirm password";
        _confirmPasswordField.textAlignment = NSTextAlignmentCenter;
        _confirmPasswordField.textColor = [UIColor blackColor];
        _confirmPasswordField.backgroundColor = [UIColor whiteColor];
        _confirmPasswordField.secureTextEntry = YES;
    }
    return _confirmPasswordField;
}
- (UILabel *)confirmPasswordFieldError {
    if (!_confirmPasswordFieldError) {
        _confirmPasswordFieldError = [[UILabel alloc]init];
        _confirmPasswordFieldError.text = @"";
        _confirmPasswordFieldError.textColor = [UIColor redColor];
        //        _confirmPasswordFieldError.font = [_confirmPasswordFieldError.font fontWithSize:30];
        _confirmPasswordFieldError.font = [UIFont systemFontOfSize:10];
        _confirmPasswordFieldError.textAlignment = NSTextAlignmentCenter;
        //        _confirmPasswordFieldError.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _confirmPasswordFieldError.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _confirmPasswordFieldError.font = [UIFont italicSystemFontOfSize:15];
        //        _confirmPasswordFieldError.backgroundColor = [UIColor blackColor];
    }
    return _confirmPasswordFieldError;
    
}
- (UIView *)confirmPasswordFieldView{
    if (!_confirmPasswordFieldView){
        _confirmPasswordFieldView = [[UIView alloc]init];
        _confirmPasswordFieldView.backgroundColor = [UIColor clearColor];
    }
    return _confirmPasswordFieldView;
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

- (UILabel *)registerLabel {
    if (!_registerLabel) {
        _registerLabel = [[UILabel alloc]init];
        _registerLabel.text = @"REGISTRATION";
        _registerLabel.textColor = [UIColor whiteColor];
        //        _registerLabel.font = [_registerLabel.font fontWithSize:30];
        _registerLabel.font = [UIFont systemFontOfSize:30];
        _registerLabel.textAlignment = NSTextAlignmentCenter;
        //        _registerLabel.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _registerLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _registerLabel.font = [UIFont italicSystemFontOfSize:15];
//                _registerLabel.backgroundColor = [UIColor blueColor];
        _registerLabel.layer.cornerRadius = 10;
        _registerLabel.layer.borderColor = [UIColor greenColor].CGColor;
        _registerLabel.layer.borderWidth = 1;
    }
    return _registerLabel;
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
    [_registerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(40);
    }];
    
    [_fieldContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_registerLabel.mas_bottom).offset(40);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.8);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
    
    // field views
    NSArray * fieldViewArray = @[_emailFieldView, _passwordFieldView, _confirmPasswordFieldView, _firstNameFieldView, _lastNameFieldView, _phoneNumberFieldView, _registerButtonView, _logInbuttonView];
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
    
    NSArray * fieldArrayError = @[_emailFieldError, _passwordFieldError, _confirmPasswordFieldError, _firstNameFieldError, _lastNameFieldError, _phoneNumberFieldError];
    [fieldArrayError mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_fieldContainer.mas_centerX);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(10);
    }];
    
    NSArray * fieldArray = @[_emailField, _passwordField, _confirmPasswordField, _firstNameField, _lastNameField, _phoneNumberField, _registerButton, _logInbutton];
    
    [fieldArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_fieldContainer.mas_centerX);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(40);
    }];
    
    
    
    
    
    
    
}
#pragma mark - Actions

- (void)registerAction:(UIButton*)sender{
    NSArray * fieldArray = @[_emailField, _passwordField, _confirmPasswordField, _firstNameField, _lastNameField, _phoneNumberField];
    NSArray * fieldArrayError = @[_emailFieldError, _passwordFieldError, _confirmPasswordFieldError, _firstNameFieldError, _lastNameFieldError, _phoneNumberFieldError];
    
    
    // empty error fields
    for (UILabel * label in fieldArrayError){
        label.text = @"";
    }
    
    // check if email is valid
    if (![User isEmailValid:_emailField.text]){
        _emailFieldError.text = @"Invalid email.";
    }
    
    
    // check if there are empty fields
    int i = 0;
    int emptyCounter = 0;
    for (UITextField * field in fieldArray){
        if ([field.text length] == 0 || field.text == nil){
            ((UILabel*)[fieldArrayError objectAtIndex:i]).text = @"This field is required";
            emptyCounter++;
        }
        i++;
    }
    if (emptyCounter){
        return;
    }
    
    
    // check if same password
    if (![_passwordField.text isEqualToString:_confirmPasswordField.text]){
        _confirmPasswordFieldError.text = @"Passwords do not match.";
        return;
    }
    
    // if passwords are the same and no empty fields
    NSDictionary * accountToRegister = @{
        @"email":_emailField.text,
        @"password":_confirmPasswordField.text,
        @"firstName":_firstNameField.text,
        @"lastName":_lastNameField.text,
        @"phoneNumber":_phoneNumberField.text
    };
    
    NSDictionary * result =  [User addUser:accountToRegister];
    if ([result objectForKey:@"error"]){
        NSString * error = [result objectForKey:@"error"];
        NSLog(@"%@", error);
        NSLog(@"%@", [result objectForKey:@"description"]);
        if ([error isEqualToString:@"email"]){
            _emailFieldError.text = [result objectForKey:@"description"];
        }
        if ([error isEqualToString:@"password"]){
            _passwordFieldError.text = [result objectForKey:@"description"];
        }
        
        return;
    }
    
    // go to login page
    LoginViewController * loginViewController = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginViewController animated:YES];
    
    
    
    
}

- (void)logInAction:(UIButton*)sender{
    
    LoginViewController * loginViewController = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginViewController animated:YES];
    
}

@end
