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
    
    func getComicTitle() -> String {
        return comicModel?.title ?? ""
    }
    
    func getComicImageUrl() -> URL? {
        guard let url = URL(string: comicModel?.img ?? "") else{
            return nil
        }
        return url
    }
    
    /// Load previous comic
    func loadPrev(_ networkingEngineProtocol: NetWorkingEngineProtocol.Type = NetWorkingEngine.self) {
        guard currentComicIndex > 1 else {
            return
        }
        currentComicIndex -= 1
        self.loadComic(endpoint: .getComicWith(index: currentComicIndex), networkingEngineProtocol)
    }
    
    /// Load next comic
    func loadNext(_ networkingEngineProtocol: NetWorkingEngineProtocol.Type = NetWorkingEngine.self) {
        guard currentComicIndex < XkcdComicConstants.maxComicIndex else {
            return
        }
        currentComicIndex += 1
        self.loadComic(endpoint: .getComicWith(index: currentComicIndex), networkingEngineProtocol)
    }
    
    /// Load current comic
    func loadCurrent(_ networkingEngineProtocol: NetWorkingEngineProtocol.Type = NetWorkingEngine.self) {
        self.loadComic(endpoint: .getCurrentComic, networkingEngineProtocol)
    }
    
    /// Load comics from XkcdEndpoint and store in comicModel
    ///
    /// - Parameter endpoint:the endpoint that we want to load data from
    ///             networkingEngineProtocol: networking engine protocol, made it easy to do unit test
    func loadComic(endpoint: XkcdEndpoint, _ networkingEngineProtocol: NetWorkingEngineProtocol.Type = NetWorkingEngine.self) {
        networkingEngineProtocol.request(endpoint: endpoint) { (result: Result<ComicData, Error>) in
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

