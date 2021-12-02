//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Ivan Lopez on 29/11/21.
//

import XCTest

class RemoteFeedLoader {
    
}

class HttpClient {
    var requestedUrl: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesntRequestDataFromURL() {
        let client = HttpClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedUrl)
        
    }
}
