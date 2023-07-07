//
//  ProfileViewController.m
//  dekideks-w5p2-20220804-profileUser
//
//  Created by Dekideks on 8/4/22.
//

#import "ProfileViewController.h"
#import <Masonry/Masonry.h>
#import "User.h"
#import "LoginViewController.h"

@interface ProfileViewController ()
@property (nonatomic, strong) User * currentUser;

@property (nonatomic, strong) UIView * profileContainer;
@property (nonatomic, strong) UIView * fieldsContainer;

@property (nonatomic, strong) UIImageView * profilePhoto;
@property (nonatomic, strong) UIImage * image;

@property (nonatomic, strong) UIView * emailView;
@property (nonatomic, strong) UILabel * emailLabel;
@property (nonatomic, strong) UILabel * emailValue;
@property (nonatomic, strong) UITextField * emailField;

@property (nonatomic, strong) UIView * firstNameView;
@property (nonatomic, strong) UILabel * firstNameLabel;
@property (nonatomic, strong) UILabel * firstNameValue;
@property (nonatomic, strong) UITextField * firstNameField;

@property (nonatomic, strong) UIView * lastNameView;
@property (nonatomic, strong) UILabel * lastNameLabel;
@property (nonatomic, strong) UILabel * lastNameValue;
@property (nonatomic, strong) UITextField * lastNameField;

@property (nonatomic, strong) UIView * phoneNumberView;
@property (nonatomic, strong) UILabel * phoneNumberLabel;
@property (nonatomic, strong) UILabel * phoneNumberValue;
@property (nonatomic, strong) UITextField * phoneNumberField;

@property (nonatomic, strong) UIView * editButtonView;
@property (nonatomic, strong) UIButton * editButton;

@property (nonatomic, strong) UIView * logOutButtonView;
@property (nonatomic, strong) UIButton * logOutButton;


@property (nonatomic, strong) NSMutableArray * fieldViews;
@property (nonatomic, strong) NSMutableArray * values;
@property (nonatomic, strong) NSMutableArray * textFields;

@property (nonatomic, strong) NSDictionary * user;

@property (nonatomic, strong) UIButton * changePhoto;


@end

@implementation ProfileViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self currentUser];
    [self setUpComponents];
    [self setUpConstraints];
    
    [self.values addObjectsFromArray:@[_firstNameValue, _lastNameValue, _phoneNumberValue]];
    [self.fieldViews addObjectsFromArray:@[_firstNameView, _lastNameView, _phoneNumberView]];
    [self.textFields addObjectsFromArray:@[self.firstNameField, self.lastNameField, self.phoneNumberField]];
    
    [self reloadValues];
    //    [self removeSubViews:_values];
    //    [self addSubViews:_textFields];
}

#pragma mark - Components
- (void)setUpComponents{
    [self.view addSubview:self.profileContainer];
    
    [_profileContainer addSubview:self.profilePhoto];
    //    [_profilePhoto addSubview:self.changePhoto];
    
    [_profileContainer addSubview:self.fieldsContainer];
    
    
    [_fieldsContainer addSubview:self.emailView];
    [_emailView addSubview:self.emailLabel];
    [_emailView addSubview:self.emailValue];
    
    [_fieldsContainer addSubview:self.firstNameView];
    [_firstNameView addSubview:self.firstNameLabel];
    [_firstNameView addSubview:self.firstNameValue];
    
    [_fieldsContainer addSubview:self.lastNameView];
    [_lastNameView addSubview:self.lastNameLabel];
    [_lastNameView addSubview:self.lastNameValue];
    
    [_fieldsContainer addSubview:self.phoneNumberView];
    [_phoneNumberView addSubview:self.phoneNumberLabel];
    [_phoneNumberView addSubview:self.phoneNumberValue];
    
    [_fieldsContainer addSubview:self.editButtonView];
    [_editButtonView addSubview:self.editButton];
    
    [_fieldsContainer addSubview:self.logOutButtonView];
    [_logOutButtonView addSubview:self.logOutButton];
    
    
}
- (UIButton *)changePhoto{
    if (!_changePhoto){
        _changePhoto = [[UIButton alloc]init];
        _changePhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_changePhoto setTitle:@"EDIT" forState:UIControlStateNormal];
        _changePhoto.titleLabel.font = [_changePhoto.titleLabel.font fontWithSize:10];
        _changePhoto.layer.borderWidth = 0.4;
        _changePhoto.layer.cornerRadius = 3;
        [_changePhoto setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _changePhoto.backgroundColor = [UIColor grayColor];
        [_changePhoto addTarget:self action:@selector(changePhotoAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changePhoto;
}
- (User *)currentUser{
    if (!_currentUser){
        _currentUser = [[User alloc]initWithUserEmail:_userEmail];
        
    }
    return _currentUser;
}

- (void)addSubViews: (NSArray *)views{
    int i = 0;
    for (UIView * view in views){
        [[self.fieldViews objectAtIndex:i] addSubview:view];
        i++;
    }
    [self setUpConstraints];
}

- (void)removeSubViews: (NSArray *)views{
    
    for (UIView * view in views){
        [self removeSubView:view];
    }
    
}

- (NSDictionary *)user{
    if (!_user){
        _user = [User findUserByEmail:_userEmail];
    }
    return _user;
}

- (void)removeSubView:(UIView*)subView{
    
    [subView.superview willRemoveSubview:subView];
    [subView removeFromSuperview];
}

- (NSMutableArray *)textFields{
    if (!_textFields){
        _textFields = [[NSMutableArray alloc]init];
    }
    return _textFields;
}

- (NSMutableArray *)fieldViews{
    if (!_fieldViews){
        _fieldViews = [[NSMutableArray alloc]init];
    }
    return _fieldViews;
}
- (NSMutableArray *)values{
    if (!_values){
        _values = [[NSMutableArray alloc]init];
    }
    return _values;
}

- (UIView *)editButtonView{
    if (!_editButtonView){
        _editButtonView = [[UIView alloc]init];
        //        _editButtonView.backgroundColor = [UIColor clearColor];
    }
    return _editButtonView;
}
- (UIButton *)editButton{
    if (!_editButton){
        _editButton = [[UIButton alloc]init];
        _editButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _editButton.titleLabel.font = [_editButton.titleLabel.font fontWithSize:20];
        _editButton.layer.borderWidth = 0.2;
        _editButton.layer.cornerRadius = 10;
        [_editButton setTitle:@"Edit" forState:UIControlStateNormal];
        [_editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _editButton.backgroundColor = [UIColor grayColor];
        [_editButton addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editButton;
}

- (UIView *)logOutButtonView{
    if (!_logOutButtonView){
        _logOutButtonView = [[UIView alloc]init];
        //        _editButtonView.backgroundColor = [UIColor clearColor];
    }
    return _logOutButtonView;
}
- (UIButton *)logOutButton{
    if (!_logOutButton){
        _logOutButton = [[UIButton alloc]init];
        _logOutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _logOutButton.titleLabel.font = [_editButton.titleLabel.font fontWithSize:20];
        _logOutButton.layer.borderWidth = 0.2;
        _logOutButton.layer.cornerRadius = 10;
        [_logOutButton setTitle:@"Log Out" forState:UIControlStateNormal];
        [_logOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _logOutButton.backgroundColor = [UIColor redColor];
        [_logOutButton addTarget:self action:@selector(logOutAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logOutButton;
}

- (UIImageView *)profilePhoto {
    if(!_profilePhoto){
        UIImage * image = [self.currentUser loadUserImage];
        
        if (image){
            _profilePhoto = [[UIImageView alloc]initWithImage:image];
        } else {
            _profilePhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"default.png"]];
        }
        
        
        NSLog(@"profile photo %@", self.currentUser.profilePhotoFileName);
        
        _profilePhoto.layer.borderWidth = 1.0;
        _profilePhoto.layer.cornerRadius = 35;
        _profilePhoto.backgroundColor = UIColor.brownColor;
        _profilePhoto.clipsToBounds = YES;
        
    }
    return _profilePhoto;
}

- (UITextField *) phoneNumberField{
    if (!_phoneNumberField){
        _phoneNumberField = [[UITextField alloc]init];
        _phoneNumberField.layer.borderWidth = 0.2f;
        _phoneNumberField.layer.cornerRadius = 10;
        _phoneNumberField.placeholder = @"phoneNumber address";
        _phoneNumberField.textAlignment = NSTextAlignmentCenter;
        _phoneNumberField.textColor = [UIColor blackColor];
        _phoneNumberField.backgroundColor = [UIColor whiteColor];
    }
    return _phoneNumberField;
}

- (UILabel *)phoneNumberValue {
    if (!_phoneNumberValue) {
        _phoneNumberValue = [[UILabel alloc]init];
        _phoneNumberValue.text = @"lorem ipsum";
        _phoneNumberValue.textColor = [UIColor blackColor];
        //        _phoneNumberValue.font = [_phoneNumberValue.font fontWithSize:30];
        _phoneNumberValue.font = [UIFont systemFontOfSize:17];
        _phoneNumberValue.textAlignment = NSTextAlignmentCenter;
        //        _phoneNumberValue.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _phoneNumberValue.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _phoneNumberValue.font = [UIFont italicSystemFontOfSize:15];
        //        _phoneNumberValue.backgroundColor = [UIColor blackColor];
    }
    return _phoneNumberValue;
}

- (UILabel *)phoneNumberLabel {
    if (!_phoneNumberLabel) {
        _phoneNumberLabel = [[UILabel alloc]init];
        _phoneNumberLabel.text = @"phoneNumber:";
        _phoneNumberLabel.textColor = [UIColor blackColor];
        //        _phoneNumberLabel.font = [_phoneNumberLabel.font fontWithSize:30];
        _phoneNumberLabel.font = [UIFont systemFontOfSize:12];
        _phoneNumberLabel.textAlignment = NSTextAlignmentCenter;
        //        _phoneNumberLabel.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _phoneNumberLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _phoneNumberLabel.font = [UIFont italicSystemFontOfSize:15];
        //        _phoneNumberLabel.backgroundColor = [UIColor blackColor];
    }
    return _phoneNumberLabel;
}


- (UIView *)phoneNumberView{
    if (!_phoneNumberView){
        _phoneNumberView = [[UIView alloc]init];
        //        _phoneNumberView.backgroundColor = [UIColor orangeColor];
    }
    return _phoneNumberView;
}

//

- (UITextField *) lastNameField{
    if (!_lastNameField){
        _lastNameField = [[UITextField alloc]init];
        _lastNameField.layer.borderWidth = 0.2f;
        _lastNameField.layer.cornerRadius = 10;
        _lastNameField.placeholder = @"lastName address";
        _lastNameField.textAlignment = NSTextAlignmentCenter;
        _lastNameField.textColor = [UIColor blackColor];
        _lastNameField.backgroundColor = [UIColor whiteColor];
    }
    return _lastNameField;
}

- (UILabel *)lastNameValue {
    if (!_lastNameValue) {
        _lastNameValue = [[UILabel alloc]init];
        _lastNameValue.text = @"lorem ipsum";
        _lastNameValue.textColor = [UIColor blackColor];
        //        _lastNameValue.font = [_lastNameValue.font fontWithSize:30];
        _lastNameValue.font = [UIFont systemFontOfSize:17];
        _lastNameValue.textAlignment = NSTextAlignmentCenter;
        //        _lastNameValue.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _lastNameValue.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _lastNameValue.font = [UIFont italicSystemFontOfSize:15];
        //        _lastNameValue.backgroundColor = [UIColor blackColor];
    }
    return _lastNameValue;
}

- (UILabel *)lastNameLabel {
    if (!_lastNameLabel) {
        _lastNameLabel = [[UILabel alloc]init];
        _lastNameLabel.text = @"lastName:";
        _lastNameLabel.textColor = [UIColor blackColor];
        //        _lastNameLabel.font = [_lastNameLabel.font fontWithSize:30];
        _lastNameLabel.font = [UIFont systemFontOfSize:12];
        _lastNameLabel.textAlignment = NSTextAlignmentCenter;
        //        _lastNameLabel.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _lastNameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _lastNameLabel.font = [UIFont italicSystemFontOfSize:15];
        //        _lastNameLabel.backgroundColor = [UIColor blackColor];
    }
    return _lastNameLabel;
}


- (UIView *)lastNameView{
    if (!_lastNameView){
        _lastNameView = [[UIView alloc]init];
        //        _lastNameView.backgroundColor = [UIColor orangeColor];
    }
    return _lastNameView;
}

//

- (UITextField *) firstNameField{
    if (!_firstNameField){
        _firstNameField = [[UITextField alloc]init];
        _firstNameField.layer.borderWidth = 0.2f;
        _firstNameField.layer.cornerRadius = 10;
        _firstNameField.placeholder = @"firstName address";
        _firstNameField.textAlignment = NSTextAlignmentCenter;
        _firstNameField.textColor = [UIColor blackColor];
        _firstNameField.backgroundColor = [UIColor whiteColor];
    }
    return _firstNameField;
}

- (UILabel *)firstNameValue {
    if (!_firstNameValue) {
        _firstNameValue = [[UILabel alloc]init];
        _firstNameValue.text = @"lorem ipsum";
        _firstNameValue.textColor = [UIColor blackColor];
        //        _firstNameValue.font = [_firstNameValue.font fontWithSize:30];
        _firstNameValue.font = [UIFont systemFontOfSize:17];
        _firstNameValue.textAlignment = NSTextAlignmentCenter;
        //        _firstNameValue.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _firstNameValue.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _firstNameValue.font = [UIFont italicSystemFontOfSize:15];
        //        _firstNameValue.backgroundColor = [UIColor blackColor];
    }
    return _firstNameValue;
}

- (UILabel *)firstNameLabel {
    if (!_firstNameLabel) {
        _firstNameLabel = [[UILabel alloc]init];
        _firstNameLabel.text = @"firstName:";
        _firstNameLabel.textColor = [UIColor blackColor];
        //        _firstNameLabel.font = [_firstNameLabel.font fontWithSize:30];
        _firstNameLabel.font = [UIFont systemFontOfSize:12];
        _firstNameLabel.textAlignment = NSTextAlignmentCenter;
        //        _firstNameLabel.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _firstNameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _firstNameLabel.font = [UIFont italicSystemFontOfSize:15];
        //        _firstNameLabel.backgroundColor = [UIColor blackColor];
    }
    return _firstNameLabel;
}


- (UIView *)firstNameView{
    if (!_firstNameView){
        _firstNameView = [[UIView alloc]init];
        //        _firstNameView.backgroundColor = [UIColor orangeColor];
    }
    return _firstNameView;
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

- (UILabel *)emailValue {
    if (!_emailValue) {
        _emailValue = [[UILabel alloc]init];
        _emailValue.text = @"lorem ipsum";
        _emailValue.textColor = [UIColor blackColor];
        //        _emailValue.font = [_emailValue.font fontWithSize:30];
        _emailValue.font = [UIFont systemFontOfSize:17];
        _emailValue.textAlignment = NSTextAlignmentCenter;
        //        _emailValue.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _emailValue.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _emailValue.font = [UIFont italicSystemFontOfSize:15];
        //        _emailValue.backgroundColor = [UIColor blackColor];
    }
    return _emailValue;
}

- (UILabel *)emailLabel {
    if (!_emailLabel) {
        _emailLabel = [[UILabel alloc]init];
        _emailLabel.text = @"Email:";
        _emailLabel.textColor = [UIColor blackColor];
        //        _emailLabel.font = [_emailLabel.font fontWithSize:30];
        _emailLabel.font = [UIFont systemFontOfSize:12];
        _emailLabel.textAlignment = NSTextAlignmentCenter;
        //        _emailLabel.font = [UIFont fontWithDescriptor:descriptor size:30];
        //        _emailLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        //        _emailLabel.font = [UIFont italicSystemFontOfSize:15];
        //        _emailLabel.backgroundColor = [UIColor blackColor];
    }
    return _emailLabel;
}


- (UIView *)emailView{
    if (!_emailView){
        _emailView = [[UIView alloc]init];
        //        _emailView.backgroundColor = [UIColor blueColor];
    }
    return _emailView;
}
- (UIView *)fieldsContainer{
    if (!_fieldsContainer){
        _fieldsContainer = [[UIView alloc]init];
        //        _fieldsContainer.backgroundColor = [UIColor redColor];
    }
    return _fieldsContainer;
}
- (UIView *)profileContainer{
    if (!_profileContainer){
        _profileContainer = [[UIView alloc]init];
        //        _profileContainer.backgroundColor = [UIColor yellowColor];
    }
    return _profileContainer;
}

#pragma mark - Constraints
- (void)setUpConstraints{
    [_profileContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.8);
        make.height.mas_equalTo(self.view.mas_height).multipliedBy(0.8);
        make.center.mas_equalTo(self.view);
    }];
    [_fieldsContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.height.mas_equalTo(_profileContainer.mas_height).multipliedBy(0.7);
        make.width.mas_equalTo(_profileContainer.mas_width);
        
    }];
    [_profilePhoto mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
        make.bottom.mas_equalTo(_fieldsContainer.mas_top).offset(-40);
        make.centerX.mas_equalTo(_profileContainer);
        make.top.mas_equalTo(_profileContainer.mas_top).offset(50);
    }];
    [_changePhoto mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(12);
        make.centerX.mas_equalTo(_profilePhoto);
        make.bottom.mas_equalTo(_profilePhoto.mas_bottom);
    }];
    
    
    NSArray * fieldViews = @[_emailView, _firstNameView, _lastNameView, _phoneNumberView, _editButtonView, _logOutButtonView];
    
    [fieldViews mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:15 leadSpacing:0 tailSpacing:0];
    
    [fieldViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_fieldsContainer.mas_width);
        make.height.mas_equalTo(40);
    }];
    [_editButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_fieldsContainer);
        make.height.mas_equalTo(40);
    }];
    
    [_logOutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_fieldsContainer);
        make.height.mas_equalTo(40);
    }];
    
    for (UIView * view in fieldViews){
        
        if ([view.subviews count] > 1){
            UILabel * fieldLabel = view.subviews[0];
            UILabel * fieldValue = view.subviews[1];
            
            [fieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(_fieldsContainer);
                make.height.mas_equalTo(15);
            }];
            [fieldValue mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(fieldLabel.mas_bottom).offset(2);
                make.width.mas_equalTo(_fieldsContainer);
                make.height.mas_equalTo(25);
            }];
        }
        
        
    }
    
    
}
#pragma mark - Actions
- (void)editAction:(UIButton*)sender{
    NSString * buttonText = sender.titleLabel.text;
    
    if ([buttonText isEqualToString:@"Edit"]){
        [self.view addSubview:self.changePhoto];
        
        [self removeSubViews:_values];
        [self addSubViews:_textFields];
        [sender setTitle:@"Save" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor blueColor]];
        
        
    } else {
        
        
        [self removeSubViews:_textFields];
        [self addSubViews:_values];
        [self removeSubView:self.changePhoto];
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor grayColor]];
        
        
        
        NSDictionary * modifications = [self modifications];
        if (modifications){
            [self updateFromModifications:modifications];
        }
        
        
        
        [self reloadValues];
    }
}

- (void)logOutAction:(UIButton*)sender{
    LoginViewController * logInViewController = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:logInViewController animated:YES];
}

// ------ change photo
- (void)changePhotoAction:(UIButton *)sender{
    NSLog(@"picked");
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    // get the image chosen
    UIImage * image = info[UIImagePickerControllerEditedImage];
    
    [self.profilePhoto setImage:image];
    
    // save the image
//    [User saveImage:image imageName:@"avatar.png"];
    [_currentUser saveUserImage:image];
    [User updateUser:_currentUser.email key:@"profilePhotoFileName" value:_currentUser.profilePhotoFileName];
    NSLog(@"filename ------ %@", _currentUser.profilePhotoFileName);
    
    // free up the allocated picker controller
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // reload the image
//    [self reloadImage];
    _profilePhoto = nil;
    [self profilePhoto];
//    [_profilePhoto setImage:self.image];
    
}

// ------
- (void)updateFromModifications: (NSDictionary*)modifications{
    NSLog(@"modifications %@", modifications);
    for (NSString * key in [modifications allKeys]){
        if ([key isEqualToString:@"email"]){
            _userEmail = [modifications objectForKey:key];
        }
        
        [User updateUser:_userEmail key:key value:[modifications objectForKey:key]];
    }
    
    
}

- (NSMutableDictionary *)modifications{
    //
    NSArray * fieldTexts = @[_firstNameField.text, _lastNameField.text, _phoneNumberField.text];
//    NSLog(@"emailfield: %@", _emailField.text);
    NSArray * storedFields = @[@"firstName", @"lastName", @"phoneNumber"];
    
    NSMutableDictionary * modifiedDict = [[NSMutableDictionary alloc]init];
    
    int i = 0;
    for (NSString * text in fieldTexts){
        NSString * field = [storedFields objectAtIndex:i];
        NSString * fieldValue = [self.user objectForKey:field];
        
        
//        NSLog(@"start compare");
//        NSLog(@"current field value: %@", fieldTexts[i]);
//        NSLog(@"stored field value: %@", fieldValue);
        
//        NSLog(@"value equal?: %i", [text isEqualToString:fieldValue]);
        
        if (![text isEqualToString:fieldValue]){
            [modifiedDict addEntriesFromDictionary:@{field: text}];
        }
        
        i++;
    }
    NSLog(@"modified: %@", modifiedDict);
    return modifiedDict;
    
}

- (void)reloadValues{
//    [[NSUserDefaults standardUserDefaults]synchronize];
    NSDictionary * user = [User findUserByEmail:_userEmail];
    
    NSString * str;
    str = [user objectForKey:@"email"];
    NSLog(@"string -> %@", str);
    _emailValue.text = str;
    _emailField.text = str;
    
    str = [user objectForKey:@"firstName"];
    _firstNameValue.text = str;
    _firstNameField.text = str;
    
    str = [user objectForKey:@"lastName"];
    _lastNameValue.text = str;
    _lastNameField.text = str;
    
    str = [user objectForKey:@"phoneNumber"];
    _phoneNumberValue.text = str;
    _phoneNumberField.text = str;
}

@end
