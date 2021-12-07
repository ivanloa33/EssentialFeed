//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ivan Lopez on 02/12/21.
//

import Foundation

public typealias HttpClientResult = Result<HTTPURLResponse, Error>

public protocol HttpClient {
    func get(from url: URL, completion: @escaping (HttpClientResult) -> Void)
}

public class RemoteFeedLoader {
    private let url: URL
    private let client: HttpClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { result in
            switch result {
            case .success:
                completion(.invalidData)
            case .failure:
                completion(.connectivity)
            }
        }
    }
}
