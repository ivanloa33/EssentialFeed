//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Ivan Lopez on 29/11/21.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HttpClient.shared.requestedUrl = URL(string: "https://a-url.com")
    }
}

class HttpClient {
    static let shared = HttpClient()
    var requestedUrl: URL?
    
    private init() {}
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesntRequestDataFromURL() {
        let client = HttpClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestDataFromURL() {
        let client = HttpClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedUrl)
    }
}
