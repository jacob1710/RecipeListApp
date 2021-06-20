//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Jacob Scase on 13/06/2021.
//

import SwiftUI


struct RecipeListView: View {
    
    @EnvironmentObject var rModel:RecipeModel
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .font(.largeTitle)
                    .bold()
                    
                    .padding(.top,40)
                ScrollView {
                    LazyVStack(alignment: .leading){
                        ForEach(rModel.recipes){ r in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    HStack(spacing: 20.0){
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50
                                                   , height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(30.0)
                                        Text(r.name)
                                            .foregroundColor(.black)
                                    }
                                })
                            
                            
                            
                        }
                        .navigationBarHidden(true)
                    }
                }
            }
            //            .navigationBarTitle("All Recipes")
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
