//
//  XCTestCase.swift
//  EssentialFeedTests
//
//  Created by Ivan Lopez on 17/01/22.
//

import Foundation
import XCTest

extension XCTestCase {
    func trackForMemmoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.")
        }
    }
}
