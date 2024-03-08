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
   static let conjuredManaCake = "Conjured Mana Cake"
    
    public static func updateQuality(_ items: Array<Item>) -> [Item] {
        var items = items
        
        for i in 0 ..< items.count {
            
            let itemName = items[i].name
            
        //1. First decrease the quality for non special items (Age Brie and Backstage Passes)
            
            decreaseQuailtyForNonSpecialItems(&items[i], itemName: itemName)
            
        //2. Next, decrease the Sellin date if the item is not SulfurasHandOfRagnaros
            
            decreaseSellInIfNotSulfurasHandOfRagnaros(&items[i], itemName: itemName)
            
        //3. decrease the Quality for the newly added Conjured Mana Cake item
            
        //4. Lastly, update quality if the sellIn date has passed for non special items
            
            updateQualityIfSellInDateHasPassed(&items[i], itemName: itemName)
           
        }
        
        return items
    }
}
