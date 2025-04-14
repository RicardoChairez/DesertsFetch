//
//  ContentView.swift
//  Deserts
//
//  Created by Chip Chairez on 8/6/24.
//

import SwiftUI

struct RecipesView: View {
    @StateObject private var viewModel = RecipesViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if viewModel.vmState == .loaded{
                    if viewModel.recipePreviews.isEmpty {
                        Text("No recipes found")
                            .font(.caption)
                            .padding()
                    }
                    LazyVGrid(columns: viewModel.columns){
                        ForEach(viewModel.recipePreviews) { recipePreview in
                            NavigationLink(){
                                RecipeView(viewModel: RecipeViewModel(recipePreview: recipePreview))
                            } label: {
                                RecipePreviewView(recipePreview: recipePreview)
                                    .task {
                                        await viewModel.downloadImage(for: recipePreview)
                                    }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .transition(.opacity)
                    .padding([.horizontal, .bottom])
                }
                else if viewModel.vmState == .loading{
                    ProgressView()
                        .padding()
                }
                else if viewModel.vmState == .loadFailed{
                    Button() {
                        Task {
                            await getRecipes()
                        }
                    } label: {
                        Text("Retry")
                    }
                    .buttonStyle(.bordered)
                    .padding()
                }
            }
            .navigationTitle("Recipes")
            .refreshable {
                Task {
                    await getRecipes()
                }
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.alertText)
            )
        }
        .task {
            await getRecipes()
        }
    }
    
    func getRecipes() async {
        do {
            viewModel.vmState = .loading
            viewModel.recipePreviews = try await viewModel.getRecipes()
            viewModel.vmState = .loaded
        }
        catch {
            viewModel.alertText = error.localizedDescription
            viewModel.showAlert = true
            viewModel.vmState = .loadFailed
        }
    }
}

#Preview {
    RecipesView()
}
