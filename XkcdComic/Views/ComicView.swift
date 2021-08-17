//
//  ContentView.swift
//  XkcdComic
//
//  Created by mengjiao on 8/17/21.
//

import SwiftUI
import AsyncImage

struct ComicView: View {
    @ObservedObject var viewModel = ComicViewModel()
    
    var body: some View {
        VStack {
            if let link = URL(string: viewModel.comicModel?.img ?? "") {
                AsyncImageView(url: link)
            }
            
            Button(XkcdComicConstants.ButtonName.pre) {
                viewModel.loadPrev()
            }
        }.onAppear {
            viewModel.loadCurrent()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ComicView()
        }
    }
    
    
    
}
