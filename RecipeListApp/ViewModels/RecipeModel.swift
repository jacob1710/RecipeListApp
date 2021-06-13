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
}
