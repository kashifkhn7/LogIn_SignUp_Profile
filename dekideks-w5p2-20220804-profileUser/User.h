//
//  User.h
//  NSUserDefaultTest
//
//  Created by Dekideks on 8/3/22.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN



@interface User : NSObject {
    NSUserDefaults * defaultUsers;
    
}
@property (nonatomic, strong) NSMutableDictionary * currentUser;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSString * firstName;
@property (nonatomic, strong) NSString * lastName;
@property (nonatomic, strong) NSString * phoneNumber;
@property (nonatomic, strong) NSString * profilePhotoFileName;
@property (nonatomic, strong) NSString * userID;


// Create
+ (NSDictionary *)addUser: (NSDictionary *)data;

// Read
+ (NSMutableDictionary *)findUserByEmail: (NSString *)email;
+ (BOOL)isUserExisting: (NSString *)email;
+ (NSUserDefaults *)userDefaults;

// Update
+ (NSMutableDictionary *)updateUser: (NSString *)email key:(NSString *)key value:(NSString *)value;

// Delete
+ (void)removeAllUsers;

// check email
+ (BOOL)isEmailValid: (NSString *)email;

// instance methods
- (instancetype)initWithUserEmail: (NSString *)email;
- (UIImage *)loadUserImage;
- (void)saveUserImage: (UIImage*)image;

@end

NS_ASSUME_NONNULL_END
