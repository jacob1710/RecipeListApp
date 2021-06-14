//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Jacob Scase on 14/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                
                
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top,.bottom], 3)
                    ForEach(recipe.ingredients, id: \.self){ item in
                        Text("• "+item)
                            .padding([.top,.bottom],2)
                    }
                }
                .padding(.horizontal)
                    
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.top, 5)
                    ForEach(0..<recipe.directions.count, id: \.self){index in
                        Text(String(index+1)+"."+recipe.directions[index])
                            .padding([.top,.bottom], 5)
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass into detail view so we can see a preview
        
        let model = RecipeModel()
        
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
