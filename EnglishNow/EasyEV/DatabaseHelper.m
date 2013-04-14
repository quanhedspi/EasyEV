//
//  DatabaseHelper.m
//  EnglishNow
//
//  Created by Dinh Quan  on 4/10/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import "DatabaseHelper.h"
#import "Utils.h"

@implementation DatabaseHelper

- (id) initDatabaseWithPath: (NSString *) path {
    if (self = [super init]) {
        if (!(sqlite3_open([[Utils getDBPath] UTF8String], &database) == SQLITE_OK))
            return nil;
    }
    return self;
}

- (void) closeDatabase {
    sqlite3_close(database);
}

//- (NSString *) search:(NSString *) key
//{
//    
//    NSString * sqlS = [NSString stringWithFormat:@"select * from db_En_Vi where dIndex='%@'", key];
//    const char *sqlStatement = [sqlS cStringUsingEncoding:NSUTF8StringEncoding];
//    sqlite3_stmt *compiledStatement;
//    if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
//			// Loop through the results and add them to the feeds array
//        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
//				// Read the data from the result row
//            NSString *aContent = [NSString stringWithUTF8String:(char *)sqlite3_column_tex(compiledStatement, 1)];
//				// Create a new story object with the data from the database
//                
//            return aContent;
//        }
//            
//    } else {
//        printf("%s\n",sqlite3_errmsg(database));
//    }
//        
//		// Release the compiled statement from memory
//    sqlite3_finalize(compiledStatement);
//	
//    return @"";
//}
//
//- (BOOL) increaseTapTime {
//    
//}
//
//- (BOOL) checkWord: (NSString *) word {
//    NSString * sqlS = [NSString stringWithFormat:@"select * from word where word='%@'", word];
//    const char *sqlStatement = [sqlS cStringUsingEncoding:NSUTF8StringEncoding];
//    sqlite3_stmt *compiledStatement;
//    if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
//        // Loop through the results and add them to the feeds array
//        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
//            // Read the data from the result row
//            NSString *aContent = [NSString stringWithUTF8String:(char *)sqlite3_column_tex(compiledStatement, 1)];
//            // Create a new story object with the data from the database
//            
//            if (aContent !=nil) {
//                return YES;
//            }
//        }
//        
//    } else {
//        printf("%s\n",sqlite3_errmsg(database));
//    }
//    
//    // Release the compiled statement from memory
//    sqlite3_finalize(compiledStatement);
//
//}
//
//- (BOOL) addWord: (NSString *) word {
//    
//		// Setup the SQL Statement and compile it for faster access from table db_en_vi
//    NSString * sqlS = [NSString stringWithFormat:@"INSERT INTO word(word) VALUES('%@')", word];
//    const char *sqlStatement = [sqlS cStringUsingEncoding:NSUTF8StringEncoding];
//    sqlite3_stmt *compiledStatement;
//    if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
//			// Loop through the results and add them to the feeds array
//            
//    } else {
//            printf("%s\n",sqlite3_errmsg(database));
//    }
//        
//    // Release the compiled statement from memory
//    sqlite3_finalize(compiledStatement);
//
//}

@end
