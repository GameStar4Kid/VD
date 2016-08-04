//
//  SettingItem.m
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/4/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "SettingItem.h"

@interface SettingItem ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *imageName;
@property (nonatomic, readwrite) BOOL selectable;

@end

@implementation SettingItem

- (instancetype)initSettingItemWithName:(NSString *)name andImageName:(NSString *)imageName andSelectable:(BOOL)selectable {
    self = [super init];
    if (self) {
        self.name = name;
        self.imageName = imageName;
        self.selectable = selectable;
    }
    
    return self;
}

@end
