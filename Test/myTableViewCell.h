//
//  myTableViewCell.h
//  Test
//
//  Created by 张健 on 16/3/21.
//  Copyright © 2016年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewCell : UITableViewCell {
    
     BOOL			m_checked;
}

@property(nonatomic)NSInteger cellPath;

@property(nonatomic,strong)void (^buttonClick)(NSInteger );

- (void)setChecked:(BOOL)checked;

@property (weak, nonatomic) IBOutlet UIButton *rootButton;

@end
