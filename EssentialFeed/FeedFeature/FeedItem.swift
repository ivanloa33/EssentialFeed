//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Ivan Lopez on 29/11/21.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
