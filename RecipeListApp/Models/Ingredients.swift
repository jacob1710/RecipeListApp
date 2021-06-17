//
//  Ingredients.swift
//  RecipeListApp
//
//  Created by Jacob Scase on 17/06/2021.
//

import Foundation

class Ingredient: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var num:Int?
    var unit:String?
    var denom:Int?
    
}
