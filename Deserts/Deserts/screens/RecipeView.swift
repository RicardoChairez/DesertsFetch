//
//  MealView.swift
//  Deserts
//
//  Created by Chip Chairez on 8/6/24.
//

import SwiftUI

struct RecipeView: View {
    @StateObject var viewModel: RecipeViewModel
    
    var body: some View {
        ScrollView{
            VStack{
                Text(viewModel.recipePreview.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let imageData = viewModel.recipePreview.imageData {
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 4)
                        .padding(.vertical, 8)
                }
                else {
                    ProgressView()
                }
            
                Divider()
                    .padding(.vertical)
                
                if viewModel.recipe != nil {
                    Text("Ingredients")
                        .padding(.bottom)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.recipe!.ingredients, id:\.name) { ingredient in
                        Text("\(ingredient.measurement) \(ingredient.name)")
                            .padding(.vertical, 4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text("Preparation")
                        .padding(.bottom)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(0..<viewModel.recipe!.intructions.count, id:\.self) { index in
                        VStack{
                            Text("Step \(index + 1)")
                                .padding(.bottom)
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(viewModel.recipe!.intructions[index])
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.bottom, 16)
                    }
                }else {
                    ProgressView()
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
//        .task {
//            await viewModel.getRecipe()
//        }
    }
}

#Preview {
    RecipeView(viewModel: RecipeViewModel(recipePreview: RecipePreview(name: "Banana Pancakes", cuisine: "American", id: "1", imageURLString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg")))
}
