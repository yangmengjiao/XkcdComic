//
//  XkcdComicTests.swift
//  XkcdComicTests
//
//  Created by mengjiao on 8/17/21.
//

import XCTest
@testable import XkcdComic

class ComicViewModelTests: XCTestCase {

    var viewModel: ComicViewModel!
    override func setUp() {
        viewModel = ComicViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func testLoadCurrent() {
        viewModel.loadCurrent(MockNetWorkingEngine.self)
        XCTAssertEqual(viewModel.currentComicIndex,2000)
    }
    
    func testLoadPrev() {
        viewModel.loadPrev(MockNetWorkingEngine.self)
        XCTAssertEqual(viewModel.currentComicIndex,1999)
    }
    
   
    func testLoadComicSuccesss() {
        MockNetWorkingEngine.successFlag = true
        viewModel.loadComic(endpoint: .getComicWith(index: 2000), MockNetWorkingEngine.self)
        
        XCTAssertNotNil(viewModel.comicModel)
        
        let comicModel = viewModel.comicModel!
        XCTAssertEqual(comicModel.alt, MockResponseData.comicData.alt)
        XCTAssertEqual(comicModel.title, MockResponseData.comicData.title)
        XCTAssertEqual(comicModel.img, MockResponseData.comicData.img)
    }

    func testLoadComicFailed() {
        MockNetWorkingEngine.successFlag = false
        
        viewModel.loadComic(endpoint: .getComicWith(index: 2000), MockNetWorkingEngine.self)
        XCTAssertNil(viewModel.comicModel)
    }
}
