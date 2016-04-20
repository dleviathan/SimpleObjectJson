# SimpleObjectJson

it's simple parse json string to custom object with key as variable. Instead of:

<code>
@implementation User

+ (instancetype)createFromInfo:(NSDictionary *)info {
    User *user = [self new];

    user.firstName = info[@"first_name"];
    user.lastName = info[@"last_name"];
    user.age = info[@"age"];

    return user;
}

@end</code>
