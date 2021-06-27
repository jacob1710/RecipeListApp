//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Jacob Scase on 17/06/2021.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var rModel:RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        
        VStack(alignment:.leading, spacing: 0){
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
                .padding(.top,40)
            GeometryReader { geo in
                TabView{
            
                    ForEach(0..<rModel.recipes.count){ index in
                        
                        if rModel.recipes[index].featured{
                            
                            //Recipe.card
                            Button(action: {
                                //Show recipe detail sheet on press
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing:0){
                                        Image(rModel.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                        Text(rModel.recipes[index].name)
                                            .padding()
                                    }
                                }
                                })
                            .sheet(isPresented: $isDetailViewShowing){
                                //Show recipe detail view
                                RecipeDetailView(recipe: rModel.recipes[index])
                            }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width - 40, height: geo.size.height-100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x:-5, y:5)
                                
                        }
                    }
                    
                    
                }
                .tabViewStyle(
                    PageTabViewStyle(indexDisplayMode: .always)
                    )
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment:.leading, spacing: 10){
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights:")
                    .font(.headline)
                Text("Healthy")
            }
            .padding([.leading, .bottom])
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
