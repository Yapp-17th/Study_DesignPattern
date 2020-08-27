//
//  CoffeeModel.h
//  Mission02-Denny
//
//  Created by Denny on 2020/08/17.
//

#ifndef CoffeeModel_h
#define CoffeeModel_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CoffeeType) {
    CoffeeTypeEspresso,
    CoffeeTypeBlending
};

@interface Coffee : NSObject {
    NSString* coffeeName;
    CoffeeType type;
}
    
@end

#endif /* CoffeeModel_h */
