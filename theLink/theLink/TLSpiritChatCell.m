//
//  TLSpiritChatCell.m
//  theLink
//
//  Created by Herzon Rodríguez on 07/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLSpiritChatCell.h"

@implementation TLSpiritChatCell

@synthesize chatLabel = _chatLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_chatLabel release];
    [super dealloc];
}

@end
