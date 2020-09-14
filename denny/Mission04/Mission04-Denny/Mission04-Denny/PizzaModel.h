//
//  PizzaModel.h
//  Mission04-Denny
//
//  Created by Denny on 2020/09/14.
//

#ifndef PizzaModel_h
#define PizzaModel_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PizzaType) {
    PizzaTypeMeat,
    PizzaTypePepparoni
};

@interface Pizza : NSObject {
    NSString* pizzaName;
    PizzaType type;
}
    
@end


#endif /* PizzaModel_h */
