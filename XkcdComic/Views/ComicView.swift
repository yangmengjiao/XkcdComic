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
    @EnvironmentObject var errorHandling: ErrorHandling
    
    var body: some View {
        VStack {
            
            Text(viewModel.getComicTitle())
                .fontWeight(.bold)
                .font(.title)
            
            
            if let link = viewModel.getComicImageUrl() {
                AsyncImageView(url: link)
            }
            
            HStack {
                Button(XkcdComicConstants.ButtonName.pre) {
                    viewModel.loadPrev()
                }
              
                Button(XkcdComicConstants.ButtonName.next) {
                    do {
                        try viewModel.loadNext()
                    } catch {
                        self.errorHandling.handle(error: error)
                    }
                }
                
              
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
