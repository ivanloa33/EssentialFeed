//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Ivan Lopez on 29/11/21.
//

import Foundation

typealias LoadFeedResult = Result<[FeedItem], Error>

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
