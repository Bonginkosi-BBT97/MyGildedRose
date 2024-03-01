//
//  GildedRoseExtension .swift
//  GildedRose
//
//  Created by Bonginkosi Tshabalala on 2024/03/01.
//  Copyright © 2024 Tom Heinan. All rights reserved.
//

import Foundation

extension GildedRose {
    
    //MARK: Functions that check what update the items quality and sell in date based on the item
    
    // This function decreases the quality of the item if the item is not a special item (AgedBrie & BackstagePasses)
    internal static func decreaseQuailtyForNonSpecialItems(_ item: inout Item, itemName: String) {
        
        if itemName != agedBrie && itemName != backStagePasses {
            decreaseQuality(&item, itemName: itemName)
        
        } else {
           increaseQualityForBackStagePasses(&item, itemName: itemName)
        }
    }
    
    //This function decreases the sellIn date if the item is not SulfurasHandOfRagnaros
    
    internal static func decreaseSellInIfNotSulfurasHandOfRagnaros(_ item: inout Item, itemName: String) {
        
        if itemName != sulfurasHandOfRagnaros {
            item.sellIn -= 1
        }
    }
    
   // This function updates quality if the sellIn date has passed for non special items
    internal static func updateQualityIfSellInDateHasPassed(_ item: inout Item, itemName: String) {
        
        if item.sellIn < 0 {
            sellInDateHasPassed(&item, itemName: itemName)
        }
    }
    
    
     //MARK: Private Functions that update quaility
    
    // The Function below increases the quality by 1 if the item is less than the 50 which is the max.
    private static func increaseQuality (_ item: inout Item) {
        
        if item.quality < 50 {
           item.quality += 1
        }
    }
    
    // The Function below decreases the quality by 1 if the quaility of the item is greater than the 0  which is the lowest quality can get
    // And also if the item is not sulfurasHandOfRagnaros, which never decreases in quality
    
    private static func decreaseQuality (_ item: inout Item, itemName: String) {
        
        if item.quality > 0 {
            if itemName != sulfurasHandOfRagnaros {
                item.quality -= 1
            }
        }
    }
    
    
    //This function needs to increase the quality for back stage passes
    
    private static func increaseQualityForBackStagePasses (_ item: inout Item, itemName: String) {
        
        if item.quality < 50 {
            item.quality += 1
            
            if itemName == backStagePasses {
                if item.sellIn < 11 {
                    increaseQuality(&item)
                }
                
                if item.sellIn < 6 {
                    increaseQuality(&item)
                }
            }
        }
    }
    
    // This function has to decrease the quality of the item when the sell in date has passed, but it needs to increase the quality for agedBrie and Backstage passes.
    private static func sellInDateHasPassed(_ item: inout Item, itemName: String) {
        
        if itemName != agedBrie {
            
            if itemName != backStagePasses {
                decreaseQuality(&item, itemName: itemName)
                
            } else {
                item.quality -= item.quality
            }
            
        } else {
            increaseQuality(&item)
        }
    }
}
