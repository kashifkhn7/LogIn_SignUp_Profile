//
//  User.m
//  NSUserDefaultTest
//
//  Created by Dekideks on 8/3/22.
//

#import "User.h"

@implementation User

- (instancetype)initWithUserEmail: (NSString *)email{
    self = [super init];
    if (self){
        if (![User isUserExisting:email]){
            return nil;
        }
        _currentUser = [User findUserByEmail:email];
        _email = [NSString stringWithString:[_currentUser objectForKey:@"email"]];
        _password = [NSString stringWithString:[_currentUser objectForKey:@"password"]];
        _firstName = [NSString stringWithString:[_currentUser objectForKey:@"firstName"]];
        _lastName = [NSString stringWithString:[_currentUser objectForKey:@"lastName"]];
        _phoneNumber = [NSString stringWithString:[_currentUser objectForKey:@"phoneNumber"]];
        _userID = [NSString stringWithString:[_currentUser objectForKey:@"userID"]];
        
        _profilePhotoFileName = [NSString stringWithString:[_currentUser objectForKey:@"profilePhotoFileName"]];
    }
    return self;
}






+ (BOOL)isEmailValid: (NSString *)email{
    
//    NSString *emailRegEx = @"[A-Z0-9a-z._%\\+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
//    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
//    //Valid email address
//

//    if ([emailTest evaluateWithObject:email])
//    {
//        return 1;
//    }
//    return 0;
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isUserExisting: (NSString *)email{
    if ([User findUserByEmail:email]){
        return YES;
    }
    return NO;
}

+ (NSArray *)requiredFields{
    return @[@"email", @"password", @"firstName", @"lastName", @"phoneNumber"];
}

+ (NSDictionary *)addUser: (NSDictionary *)data{
    
    // check if user exists
    if ([User isUserExisting:[data objectForKey:@"email"]]){
        return @{@"error": @"email", @"description": @"User existing."};
    }
    
    for (NSString * key in [User requiredFields]){
        
        // check if have missing fields; returns a dictionary with missing field name under error key
        if (![data objectForKey:key]){
            return @{@"error": key};
        }
        // check if email provided is valid
        if ([key isEqualToString:@"email"]){
            NSString * email = [data objectForKey:key];
            if (![User isEmailValid:email]){
                return @{@"error": key, @"description": @"Invalid email."};
            }
        }
        if ([key isEqualToString:@"password"]){
            NSString * password = [data objectForKey:key];
            if (([password length] > 0 && [password length] < 8) || [password length] > 14 ){
                return @{@"error": key, @"description": @"Password must be 8 to 14 characters"};
            }
        }
        
    }
    
    
    
    // if fields are complete, create the user
    NSUserDefaults * defaultUsers = [User userDefaults];
    
    NSString * hash = [User createHash];
    
    NSMutableDictionary * account = [NSMutableDictionary dictionaryWithDictionary:data];
    // add userID and default profile photo
    [account addEntriesFromDictionary:@{@"userID": hash, @"profilePhotoFileName":@"default.png"}];
    [defaultUsers setObject:account forKey:hash];
    
    return account;
}

+ (NSMutableDictionary *)updateUser: (NSString *)email key:(NSString *)key value:(NSString *)value{
    NSMutableDictionary * user = [User findUserByEmail:email];
    
    if (!user){
        NSLog(@"No such user");
        return nil;
    }
    
    // update
    [user removeObjectForKey:key];
    [user setObject:value forKey:key];
    
    NSString * userID = [user objectForKey:@"userID"];
    [[User userDefaults] setObject:user forKey:userID];
    
    
    return user;
}

+ (NSMutableDictionary *)findUserByEmail: (NSString *)email{
    NSUserDefaults * userDefaults = [User userDefaults];
    NSDictionary * userDict = [userDefaults dictionaryRepresentation];
    NSMutableDictionary * user;
    
    for (id key in userDict){
        NSDictionary * tempUser = [userDict objectForKey:key];
        if ([tempUser isKindOfClass:[NSDictionary class]]){
            
            NSString * tempEmail = [tempUser valueForKey:@"email"];
            if ([tempEmail isEqualToString:email]){
                user = [NSMutableDictionary dictionaryWithDictionary:tempUser];
            }
        }

    }
    
    return user;
    
}

+ (void)removeAllUsers{
    NSUserDefaults * userDefaults = [User userDefaults];
    NSDictionary * userDict = [userDefaults dictionaryRepresentation];
    
    for (id key in userDict){
        [userDefaults removeObjectForKey:key];
    }
    [userDefaults synchronize];
}

+ (NSUserDefaults *)userDefaults{
    return [NSUserDefaults standardUserDefaults];
}

+(NSString *)createHash{
    NSTimeInterval millisecondsSince1970 = [[NSDate date]timeIntervalSince1970];
    NSString * uniqueString = [NSString stringWithFormat:@"%f", millisecondsSince1970];
    NSString * hash = [self sha256HashFor:uniqueString];
//    NSLog(@"%@", hash);
    return hash;
}

+(NSString*)sha256HashFor:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, (CC_LONG)strlen(str), result);

    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

// image save and load

- (UIImage *)loadUserImage{
    return [User loadImage:_profilePhotoFileName];
}
- (void)saveUserImage: (UIImage*)image{
    [User saveImage:image imageName:_email];
    self.profilePhotoFileName = [NSString stringWithFormat:@"%@.png", self.userID];
}

+ (UIImage *)loadImage:(NSString*)imageName{
    
    // get the app directory (directory + name of image file)
    NSString * imagePath = [User documentPathForFileName:imageName];
    NSLog(@"imagepath?? %@", imagePath);
    
    NSData * imageData = [NSData dataWithContentsOfFile:imagePath];
    NSLog(@"iamge ?? %@", [UIImage imageWithData:imageData]);
    return [UIImage imageWithData:imageData];
    
}

+ (void)saveImage: (UIImage*)image imageName:(NSString*)imageName{
    // get data representation of PNG image
    NSData * imageData = UIImagePNGRepresentation(image);
    
    NSString * filePath = [User documentPathForFileName:imageName];
 
    // save
    [imageData writeToFile:filePath atomically:YES];
}
+ (NSString*)documentPathForFileName: (NSString*)fileName{
    // make a file path to save the image (directory + name of image file)
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = [paths firstObject];
    NSString * filePath = [documentPath stringByAppendingPathComponent:fileName];
    
    return filePath;
}


@end
