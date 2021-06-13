//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Jacob Scase on 13/06/2021.
//

import SwiftUI


struct RecipeListView: View {
    
    //ReferenceViewModel
    @ObservedObject var rModel = RecipeModel()
    
    
    var body: some View {
        List(rModel.recipes){ r in
            HStack(spacing: 20.0){
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50
                           , height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(30.0)
                Text(r.name)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
