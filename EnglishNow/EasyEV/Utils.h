//
//  Utils.h
//  EnglishNow
//
//  Created by Dinh Quan  on 4/5/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Utils : NSObject

+ (NSString *) getDBPath ;
+ (void) copyDatabaseIfNeeded ;
+ (NSString *) search:(NSString *) key;

@end
