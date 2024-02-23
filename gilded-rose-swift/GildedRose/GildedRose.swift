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
            if items[i].name != agedBrie && items[i].name != backStagePasses {
                if items[i].quality > 0 {
                    if items[i].name != sulfurasHandOfRagnaros {
                        items[i].quality -= 1
                    }
                }
            } else {
                if items[i].quality < 50 {
                    items[i].quality += 1
                    
                    if items[i].name == backStagePasses {
                        if items[i].sellIn < 11 {
                            if items[i].quality < 50 {
                                items[i].quality += 1
                            }
                        }
                        
                        if items[i].sellIn < 6 {
                            if items[i].quality < 50 {
                                items[i].quality += 1
                            }
                        }
                    }
                }
            }
            
            if items[i].name != sulfurasHandOfRagnaros {
             
                items[i].sellIn -= 1
            }
            
            if items[i].sellIn < 0 {
                if items[i].name != agedBrie {
                    if items[i].name != backStagePasses {
                        if items[i].quality > 0 {
                            if items[i].name != sulfurasHandOfRagnaros {
                                items[i].quality -= 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if items[i].quality < 50 {
                        items[i].quality += 1
                    }
                }
            }
        }
        
        return items
    }
    
}
