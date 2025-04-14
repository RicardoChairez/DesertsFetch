//
//  MealPreviewView.swift
//  Deserts
//
//  Created by Chip Chairez on 8/6/24.
//

import SwiftUI

struct RecipePreviewView: View {
    let recipePreview: RecipePreview
    
    var body: some View {
        VStack(spacing: 8){
            Rectangle()
                .overlay {
                    if let imageData = recipePreview.imageData {
                        Image(uiImage: UIImage(data: imageData)!)
                            .resizable()
                            .scaledToFill()
                    }
                    else {
                        ProgressView()
                    }
                }
                .foregroundStyle(.clear)
                .clipped()
                .frame(height: 120)

            Text(recipePreview.name)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(2, reservesSpace: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
            
            Text(recipePreview.cuisine)
                .font(.subheadline)
                .fontWeight(.ultraLight)
                .lineLimit(1, reservesSpace: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .bottom], 8)
        }
        .background(.card)
        .cornerRadius(20)
        .shadow(color: Color(.black.opacity(0.2)), radius: 4)
        .padding(.vertical, 8)
    }
}

#Preview {
    RecipePreviewView(recipePreview: RecipePreview(name: "Banana Pancakes", cuisine: "American", id: "1", imageURLString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg"))
}
