//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Ivan Lopez on 29/11/21.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedItem], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
