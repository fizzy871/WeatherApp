// FatalError.swift

import Foundation

struct FatalError: Swift.Error, LocalizedError {
    var errorDescription: String?
    var failureReason: String?
    var recoverySuggestion: String?
    var helpAnchor: String?
}
