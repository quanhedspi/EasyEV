//
//  Utils.m
//  EnglishNow
//
//  Created by Dinh Quan  on 4/5/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (void) copyDatabaseIfNeeded {
	//Using NSFileManager we can perform many file system operations.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSString *dbPath = [self getDBPath];
	BOOL success = [fileManager fileExistsAtPath:dbPath];
    NSLog(@"Path store database is %@",dbPath);
	if(!success) {
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"En_Vi.db"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        NSLog(@"Path store database is %@",dbPath);
        sqlite3 *databaseHandle;
        if (sqlite3_open([dbPath UTF8String], &databaseHandle) == SQLITE_OK)
        {
            NSLog(@"db opened");
        }
		if (!success)
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
        
        // Open the database and store the handle as a data member
	}
}

+ (NSString *) getDBPath {
	//Search for standard documents using NSSearchPathForDirectoriesInDomains
	//First Param = Searching the documents directory
	//Second Param = Searching the Users directory and not the System
	//Expand any tildes and identify home directories.
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
//    NSLog(@"doc: %@", documentsDir);
	return [documentsDir stringByAppendingPathComponent:@"En_Vi.db"];
}

+ (NSString *) search:(NSString *) key
{
    sqlite3 *database;

	// Open the database from the users filessytem
	if(sqlite3_open([[Utils getDBPath] UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access from table db_en_vi
        NSString * sqlS = [NSString stringWithFormat:@"select * from db_En_Vi where dIndex='%@'", key];
		const char *sqlStatement = [sqlS cStringUsingEncoding:NSUTF8StringEncoding];
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *aContent = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				// Create a new story object with the data from the database
                
				return aContent;
            }

		} else {
            printf("%s\n",sqlite3_errmsg(database));
        }
        
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
        
        
        sqlite3_close(database);
	} else {
        printf("Error in opening database\n");
    }
	
    return @"";
}


@end
