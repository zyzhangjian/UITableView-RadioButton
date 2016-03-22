//
//  ViewController.m
//  Test
//
//  Created by 张健 on 16/3/21.
//  Copyright © 2016年 张健. All rights reserved.
//

#import "ViewController.h"

#import "myTableViewCell.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSInteger path;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property(nonatomic,strong) NSMutableArray *contacts;

@end

@implementation ViewController

#pragma mark - VC Life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    path = -1;
    
    self.contacts = [NSMutableArray array];

    for (int i = 0; i < 50; i++) {
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        [dic setValue:@"NO" forKey:@"checked"];
        
        [self.contacts addObject:dic];
    }


}


#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 64;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    myTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cells"];
    
    cell.cellPath = indexPath.row;
    
    __weak myTableViewCell *weakCell = cell;
    
    cell.buttonClick = ^(NSInteger cellPath){

        [self hiddenAllButtonWithCell:weakCell];

        NSMutableDictionary *dic = [self.contacts objectAtIndex:cellPath];

            if ([[dic objectForKey:@"checked"] isEqualToString:@"NO"]) {
                
                for (int i = 0; i < 50 ; i ++) {
                    
                    if (i == cellPath) {
                        
                        [dic setObject:cellPath == path ? @"NO" : @"YES" forKey:@"checked"];
                        
                        [weakCell setChecked:!cellPath == path];
                        
                    }
                }

                
            }else  if ([[dic objectForKey:@"checked"] isEqualToString:@"YES"]) {
                
                [dic setObject:@"NO" forKey:@"checked"];
                
                [weakCell setChecked:NO];
                
            }
            
        path = cellPath == path ? -1 : cellPath;
    
    };

    [((NSMutableDictionary*)[self.contacts objectAtIndex:indexPath.row]) setObject:[[((NSMutableDictionary*)[self.contacts objectAtIndex:indexPath.row]) objectForKey:@"checked"] isEqualToString:@"NO"] ? @"NO" : @"YES" forKey:@"checked"];
        
    [cell setChecked:[[((NSMutableDictionary*)[self.contacts objectAtIndex:indexPath.row]) objectForKey:@"checked"] isEqualToString:@"NO"] ? NO : YES];

    return cell;
}


-(void)hiddenAllButtonWithCell:(myTableViewCell *)cell {

    for (int i = 0 ; i < 50 ; i ++) {
        
        NSMutableDictionary *dic = [self.contacts objectAtIndex:i];
        
        [dic setObject:@"NO" forKey:@"checked"];
        
        [cell setChecked:NO];
        
        [_myTableView reloadData];
    }
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
