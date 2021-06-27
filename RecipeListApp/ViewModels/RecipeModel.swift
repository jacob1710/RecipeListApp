//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Jacob Scase on 13/06/2021.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    
    init() {
        //Create instance of data service and get data
                
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int)-> String{
        
        //Get a single serving size
        
        //Get target portion
        
        //Reduce fraction
        
        //Get whole portion if numerator>denominator
        
        
        //Express remainder as fraction
        
        return String(targetServings)
    }
}
