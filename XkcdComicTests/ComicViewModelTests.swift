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
    
    func testGetComicTitle() {
        self.loadComicSuccesss()
        
        let expectTitle = viewModel.getComicTitle()
        XCTAssertEqual(expectTitle, MockResponseData.comicData.title)
        
    }
    
    func testGetComicImageUrl() {
        self.loadComicSuccesss()
        
        let expectURL = viewModel.getComicImageUrl()
        XCTAssertEqual(expectURL, URL(string: MockResponseData.comicData.img ?? ""))
        
    }
    
    func testLoadCurrent() {
        viewModel.loadCurrent(MockNetWorkingEngine.self)
        XCTAssertEqual(viewModel.currentComicIndex,2000)
    }
    
    func testLoadPrev() {
        viewModel.currentComicIndex = 1000
        viewModel.loadPrev(MockNetWorkingEngine.self)
        XCTAssertEqual(viewModel.currentComicIndex,999)
    }
    
    func testLoadNext() {
        viewModel.currentComicIndex = 1000
        viewModel.loadNext(MockNetWorkingEngine.self)
        XCTAssertEqual(viewModel.currentComicIndex,1001)
    }
    
   
    func testLoadComicSuccesss() {
        self.loadComicSuccesss()
        
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
    
    //MARK：- Helper Method
    
    private func loadComicSuccesss() {
        MockNetWorkingEngine.successFlag = true
        viewModel.loadComic(endpoint: .getComicWith(index: 2000), MockNetWorkingEngine.self)
    }
}
