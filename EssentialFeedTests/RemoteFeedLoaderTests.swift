//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Ivan Lopez on 29/11/21.
//

import XCTest

class RemoteFeedLoader {
    let client: HttpClient
    let url: URL
    
    init(url: URL, client: HttpClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HttpClient {
    func get(from url: URL)
}

class HttpClientSpy: HttpClient {
    
    var requestedUrl: URL?
    
    func get(from url: URL) {
        requestedUrl = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesntRequestDataFromURL() {
        let client = HttpClientSpy()
        let url = URL(string: "https://a-url.com")!
        _ = RemoteFeedLoader(url: url, client: client)
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestDataFromURL() {
        let client = HttpClientSpy()
        let url = URL(string: "https://a-given-url.com")!
        let sut = RemoteFeedLoader(url: url, client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedUrl)
    }
}
