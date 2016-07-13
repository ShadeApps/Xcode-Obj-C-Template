//
//  MTWMeetingStringHelper.m
//  
//
//  Created by Сергей Грищёв on 27.03.15.
//
//

#import "SHDStringHelper.h"


@implementation SHDStringHelper

+ (NSString *) convertEventCountToString:(NSInteger)count{
    
    NSString *ourString = @"записей";
    NSInteger module = count%10;
    
    if (count % 100 >= 11){
        if (count % 100 <= 20){
            return ourString;
        }
    }
    if (module == 1){
        ourString = @"запись";
        return ourString;
    }
    
    if (module == 2 || module == 3  || module == 4){
        ourString = @"записи";
        return ourString;
    }

    return ourString;
}


@end
