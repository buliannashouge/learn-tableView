//
//  MyTableViewCell.m
//  TableView
//
//  Created by 王克博 on 2017/8/21.
//  Copyright © 2017年 wkb. All rights reserved.
//

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

#import "MyTableViewCell.h"
#import "UIView+Extension.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 30, 30)];
        _headImageView.layer.cornerRadius = 15;
        _headImageView.layer.masksToBounds = YES;
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_headImageView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_headImageView.right+20, _headImageView.top, screenWidth-_headImageView.right-20-20, _headImageView.height)];
        int r = arc4random() % 256;
        int g = arc4random() % 256;
        int b = arc4random() % 256;
        _nameLabel.textColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_nameLabel];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
