//
//  ViewController.m
//  MethodSwizzling
//
//  Created by qihaijun on 1/19/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(UIButton *)sender {
    NSArray *array = @[@1, @2, @3];
    NSLog(@"value: %@", array[13]);
    
    NSMutableDictionary *mutableDictonary = [NSMutableDictionary dictionary];
    mutableDictonary[nil] = nil;
    [mutableDictonary setValue:@"value" forKey:nil];
    [mutableDictonary setValue:nil forKey:@"key"];
    [mutableDictonary setObject:@"value" forKey:nil];
    [mutableDictonary setObject:array[13] forKey:@"key"];
}

@end
