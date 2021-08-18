//
//  MockResponseData.swift
//  XkcdComicTests
//
//  Created by mengjiao on 8/17/21.
//

import Foundation
@testable import XkcdComic

/// Mock Data for testing.
struct MockResponseData {
    static let comicData = ComicData(num: 2000,
                                     title: "xkcd Phone 2000",
                                     alt: "Our retina display features hundreds of pixels per inch in the central fovea region.",
                                     img: "https://imgs.xkcd.com/comics/xkcd_phone_2000.png")
}
