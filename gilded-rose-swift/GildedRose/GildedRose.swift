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
            
            if itemName != agedBrie && itemName != backStagePasses {
           
                decreaseQuality(&items[i], itemName: itemName)
            
            } else {
                
                if items[i].quality < 50 {
                    items[i].quality += 1
                    
                    if itemName == backStagePasses {
                        if items[i].sellIn < 11 {
                            increaseQuality(&items[i])
                        }
                        
                        if items[i].sellIn < 6 {
                            increaseQuality(&items[i])
                        }
                    }
                }
            }
            
            if itemName != sulfurasHandOfRagnaros {
             
                items[i].sellIn -= 1
            }
            
            if items[i].sellIn < 0 {
                if itemName != agedBrie {
                    
                    if itemName != backStagePasses {
                        decreaseQuality(&items[i], itemName: itemName)
                        
                    } else {
                        items[i].quality -= items[i].quality
                        
                    }
                } else {
                    increaseQuality(&items[i])
                }
            }
        }
        
        return items
    }
    
    //MARK: Functions Sections
    
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
}
