//
//  AppDelegate.m
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "AppDelegate.h"
#import "ItemViewController.h"
#import "PersistentStack.h"
#import "Store.h"
#import "Item.h"

@interface AppDelegate ()

@property (nonatomic, strong) Store *store;
@property (nonatomic, strong) PersistentStack *persistentStack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ItemViewController *rootViewController = [[ItemViewController alloc]init];
     UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:rootViewController];
    NSAssert([rootViewController isKindOfClass:[ItemViewController class]], @"Should have an item view controller");
    self.persistentStack = [[PersistentStack alloc]initWithStoreURL:self.storeURL modelURL:self.modelURL];
    self.store = [[Store alloc]init];
    self.store.managedObjectContext = self.persistentStack.managedObjectContext;
    rootViewController.parent = self.store.rootItem;
    
    [self.window setRootViewController:navigationController];
    
    return YES;
}

/**
 添加Student实体的测试数据
 */
- (void)addTestData {
    for (int i = 0; i < 15; i++) {
        Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:self.persistentStack.managedObjectContext];
        item.title = [NSString stringWithFormat:@"mxh %d", i];
        item.order = @(i+15);
    }
    
    NSError *error = nil;
    if (self.persistentStack.managedObjectContext.hasChanges) {
        [self.persistentStack.managedObjectContext save:&error];
    }
}

- (NSURL *)storeURL {
    NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentDirectory URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSURL *)modelURL {
    return [[NSBundle mainBundle]URLForResource:@"NestedTodoList" withExtension:@"momd"];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.store.managedObjectContext save:NULL];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
