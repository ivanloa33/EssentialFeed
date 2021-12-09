//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ivan Lopez on 02/12/21.
//

import Foundation

public class RemoteFeedLoader {
    private let url: URL
    private let client: HttpClient
    
    public typealias FeedLoaderResult = Result<[FeedItem], Error>
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (FeedLoaderResult) -> Void) {
        client.get(from: url) { result in
            switch result {
            case let .success((data, response)):
                completion(FeedItemsMapper.map(data, from: response))
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}
