//
//  ComicViewModel.swift
//  XkcdComic
//
//  Created by mengjiao on 8/17/21.
//

import Foundation
import SwiftUI
import NetworkingEngine

///  ViewModel for ComicView
class ComicViewModel: ObservableObject {
    @Published var comicModel: ComicModel?
    @Published var shouldShowIndicator = true
    
    var currentComicIndex = XkcdComicConstants.maxComicIndex
    
    /// Load previous comic
    func loadPrev() {
        guard currentComicIndex > 1 else {
            return
        }
        currentComicIndex -= 1
        self.loadComic(endpoint: .getComicWith(index: currentComicIndex))
    }
    
    /// Load current comic
    func loadCurrent() {
        self.loadComic(endpoint: .getComicWith(index: currentComicIndex))
    }
    
    /// Load comics from XkcdEndpoint and store in comicModel
    ///
    /// - Parameter endpoint:the endpoint that we want to load data from
    private func loadComic(endpoint: XkcdEndpoint) {
        NetWorkingEngine.request(endpoint: endpoint) { (result: Result<ComicData, Error>) in
            switch result {
            case .success(let comicData):
                self.comicModel = ComicModel(title: comicData.title,
                                             alt: comicData.alt,
                                             img: comicData.img)
            case .failure(let error):
                print(error)
            }
        }
    }
}

