//
//  myTableViewCell.m
//  Test
//
//  Created by 张健 on 16/3/21.
//  Copyright © 2016年 张健. All rights reserved.
//

#import "myTableViewCell.h"

@implementation myTableViewCell

- (void)awakeFromNib {

    [_rootButton addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    
}

-(void)click {
    
    if (self.buttonClick != nil) {
        
        self.buttonClick(self.cellPath);
    }
}

- (void)setChecked:(BOOL)checked {
   
    if (checked)
    {
        _rootButton.backgroundColor = [UIColor redColor];
        
    }
    else
    {
         _rootButton.backgroundColor = [UIColor grayColor];
    }
    m_checked = checked;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
