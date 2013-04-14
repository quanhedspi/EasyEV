//
//  DatabaseHelper.h
//  EnglishNow
//
//  Created by Dinh Quan  on 4/10/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DatabaseHelper : NSObject
{
    sqlite3 *database;
}

- (id) initDatabaseWithPath: (NSString *) path;

- (void) closeDatabase;

- (NSString *) search:(NSString *) key;

- (BOOL) addWord: (NSString *) word;

@end
