//
//  TableViewCell.m
//  YLTableViewCellDeleteAll
//
//  Created by xuanlin.zhu on 15/12/15.
//  Copyright © 2015年 xuanlin.zhu. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (UIView *subView in self.subviews) {
        if ([NSStringFromClass([subView class]) isEqualToString:@"UITableViewCellEditControl"]) {
            UIImageView *control = (UIImageView *)[subView.subviews firstObject];
            NSLog(@"333%@",control.subviews);
            control.image = [UIImage imageNamed:@"tt"];
        }
    }
}

@end
