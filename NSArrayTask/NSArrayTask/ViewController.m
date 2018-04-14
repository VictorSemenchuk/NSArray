//
//  ViewController.m
//  NSArrayTask
//
//  Created by Victor Macintosh on 14/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: Create NSArray, containing several strings, using literal declaration.
    NSArray *arrayWithLiterals = @[@"obj1", @"obj2", @"obj3"];
    
    //MARK: Create mutable array from piviously created NSArray.
    NSMutableArray *mutableArrayWithLiterals = [NSMutableArray arrayWithArray:arrayWithLiterals];
    
    //MARK: Create an empty array and obtain its first and last element in a safe way.
    NSArray *emptyArray = [[NSArray alloc] init];
    NSLog(@"> %@", [emptyArray firstObject]);
    NSLog(@"> %@", [emptyArray lastObject]);
    
    //MARK: Create NSArray, containing strings from 1 to 20
    NSMutableArray *tempArray1to20 = [[NSMutableArray alloc] init];
    for(int i = 1; i <= 20; i++) {
        [tempArray1to20 addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *array1to20 = [NSKeyedUnarchiver unarchiveObjectWithData: [NSKeyedArchiver archivedDataWithRootObject:tempArray1to20]];
    
    //MARK: Get its shallow copy and real deep copy
    //Shallow copy
    NSArray *shallowCopyArray = [array1to20 copy];
    //Real deep copy
    NSArray *realDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData: [NSKeyedArchiver archivedDataWithRootObject:array1to20]];
    
    //MARK: Iterate over array and obtain item at index 13. Print an item.
    [array1to20 enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 13) {
            NSLog(@"> Item at [13]: %@", obj);
            *stop = YES;
        }
    }];
    
    //MARK: Make array mutable. Add two new entries to the end of the array, add an entry to the beginning of the array. Iterate over an array and remove item at index 5.
    NSMutableArray *mutableArray1to20 = [array1to20 mutableCopy];
    [mutableArray1to20 addObject:@"21"];
    [mutableArray1to20 addObject:@"22"];
    [mutableArray1to20 insertObject:@"0" atIndex:0];
    [mutableArray1to20 enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(idx == 5) {
            [mutableArray1to20 removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
    
    //MARK: Create new array of mixed numbers. Sort it in an ascending and descending order.
    NSArray *arrayForSorting = @[@10, @2, @3];
    
    //Sort in an ascending order
    NSArray *orderedAscendingArray = [arrayForSorting sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSLog(@"> Array in an ascending order:");
    for(id item in orderedAscendingArray) {
        NSLog(@"%@", item);
    }
    
    //Sort in an descending order
    NSArray *orderedDescendingArray = [arrayForSorting sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSLog(@"> Array in an descending order:");
    for(id item in orderedDescendingArray) {
        NSLog(@"%@", item);
    }
    
    //Releasing
    
    [mutableArray1to20 release];
    [shallowCopyArray release];
    [tempArray1to20 release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
