//
//  GildedRose.swift
//  GildedRose
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

public class GildedRose {

   static let agedBrie = "Aged Brie"
   static let backStagePasses = "Backstage passes to a TAFKAL80ETC concert"
   static let sulfurasHandOfRagnaros = "Sulfuras, Hand of Ragnaros"
    
    public static func updateQuality(_ items: Array<Item>) -> [Item] {
        var items = items
        
        for i in 0 ..< items.count {
            
            let itemName = items[i].name
            
        //1. First decrease the quality for non special items (Age Brie and Backstage Passes)
            
            decreaseQuailtyForNonSpecialItems(&items[i], itemName: itemName)
            
        //2. Next, decrease the quality if the item is not SulfurasHandOfRagnaros
            
            decreaseSellInIfNotSulfurasHandOfRagnaros(&items[i], itemName: itemName)
            
        //3. Lastly, update quality if the sellIn date has passed for non special items
            
           
            //updateQualityIfSellInDateHasPassed()
            if items[i].sellIn < 0 {
                sellInDateHasPassed(&items[i], itemName: itemName)
            }
        }
        
        return items
    }
    
    //MARK: --- FUNCTIONS SECTION ---
    
    //MARK: Functions that check what item it is
    
    // This function decreases the quality of the item if the item is not a special item (AgedBrie & BackstagePasses)
    private static func decreaseQuailtyForNonSpecialItems(_ item: inout Item, itemName: String) {
        
        if itemName != agedBrie && itemName != backStagePasses {
       
            decreaseQuality(&item, itemName: itemName)
        
        } else {
            
           increaseQualityForBackStagePasses(&item, itemName: itemName)
        }
    }
    
    //This function decreases the quality if the item is not SulfurasHandOfRagnaros
    
    private static func decreaseSellInIfNotSulfurasHandOfRagnaros(_ item: inout Item, itemName: String) {
        if itemName != sulfurasHandOfRagnaros {
         
            item.sellIn -= 1
        }
    }
    
    private static func updateQualityIfSellInDateHasPassed() {
        
    }
    
     //MARK: Functions that update quaility
    
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
