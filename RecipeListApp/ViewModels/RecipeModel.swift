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
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil{
            //Get a single serving size
            denominator *= recipeServings
            
            //Get target portion
            numerator *= targetServings
            
            
            //Reduce fraction
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            
            
            //Get whole portion if numerator>denominator
            
            if numerator>=denominator{
                wholePortions = numerator/denominator
                numerator = numerator%denominator
                
                portion += String(wholePortions)
                
            }
            
            //Express remainder as fraction
            if numerator > 0{
                //Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit{
            //Calculate suffix for unit
            if wholePortions > 1 || (wholePortions==1 && numerator>0){
                if unit.suffix(2) == "ch"{
                    unit+="es"
                }else if unit.suffix(1) == "f"{
                    unit = String(unit.dropLast())
                    unit += "ves"
                    
                }else{
                    unit+="s"
                }
            }
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "": " "
        
            
            
            return portion+unit
        }
        
        return portion
    }
}
