//
//  OryError.swift
//  
//
//  Created by Benny Wong on 2/24/26.
//

import Foundation

public enum OryError: Error {
    case networkError(_ error: any Error)
    case validationError(_ error: any Error)
    case expiredFlow
    case invalidFlow
    case unauthorized
    case unknown(_ error: any Error)
}
