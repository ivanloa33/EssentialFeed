//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ivan Lopez on 02/12/21.
//

import Foundation

public protocol HttpClient {
    func get(from url: URL)
}

public class RemoteFeedLoader {
    private let url: URL
    private let client: HttpClient
    
    public init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(from: url)
    }
}
