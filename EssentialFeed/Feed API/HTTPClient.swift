//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Ivan Lopez on 09/12/21.
//

import Foundation

public typealias HttpClientResult = Result<(Data, HTTPURLResponse), Error>

public protocol HttpClient {
    func get(from url: URL, completion: @escaping (HttpClientResult) -> Void)
}
