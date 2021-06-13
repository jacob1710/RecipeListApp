//
//  DataService.swift
//  RecipeListApp
//
//  Created by Jacob Scase on 13/06/2021.
//

import Foundation

class DataService{
    
    static func getLocalData() -> [Recipe]{
    
        //Parse json
        
        //Get url path to json
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else{
            return [Recipe]()
        }
        
        //Create url object
        let url = URL(fileURLWithPath: pathString!)
        
        //create data object
        do {
            let data = try Data(contentsOf: url)
            
            //decode data
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)

                for recipe in recipeData{
                    //add unique ids
                    recipe.id = UUID()
                }
                //return the recipes
                return recipeData
                
            } catch  {
                //Error with parsing JSON
                print(error)
            }
            
            
            
            
            
        } catch {
            print(error)
        }
        
        
        return [Recipe]()
        
        
    }
}
