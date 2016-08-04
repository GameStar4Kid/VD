//
//  SearchItem.m
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/4/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "SearchItem.h"

@interface SearchItem ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, readwrite) BOOL selectable;

@end

@implementation SearchItem

- (instancetype)initSearchItemWithName:(NSString *)name andSelectable:(BOOL)selectable {
    self = [super init];
    if (self) {
        self.name = name;
        self.selectable = selectable;
    }
    
    return self;
}

@end
