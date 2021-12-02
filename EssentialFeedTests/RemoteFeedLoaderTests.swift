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

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesntRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedUrl, url)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HttpClientSpy) {
        let client = HttpClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HttpClientSpy: HttpClient {
        var requestedUrl: URL?
        
        func get(from url: URL) {
            requestedUrl = url
        }
    }
}
