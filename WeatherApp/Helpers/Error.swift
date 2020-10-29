// Error.swift

import Foundation

enum Error: Swift.Error {
    case networkError(Swift.Error)
    case decodingError(Swift.Error)
}
