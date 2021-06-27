//
//  RecipeHighlights.swift
//  RecipeListApp
//
//  Created by Jacob Scase on 27/06/2021.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        //Loop through highlights and build string
        for index in 0..<highlights.count{
            //If it is last item, dont add comma
            if index == highlights.count-1{
                allHighlights += highlights[index]
            }else{
                allHighlights += highlights[index]+", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test","bbb","ccc"])
    }
}
