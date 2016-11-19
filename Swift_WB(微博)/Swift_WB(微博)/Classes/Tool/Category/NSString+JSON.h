//
//  NSString+JSON.h
//  aaaaa
//
//  Created by 张森明 on 16/10/15.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *) jsonStringWithArray:(NSArray *)array;
+(NSString *) jsonStringWithString:(NSString *) string;
+(NSString *) jsonStringWithObject:(id) object;

@end
