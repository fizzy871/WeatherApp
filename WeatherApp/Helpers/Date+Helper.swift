// Date+Helper.swift

import Foundation

private let fullDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d, yyyy"
    return formatter
}()

extension Date {
    func fullDate() -> String {
        return fullDateFormatter.string(from: self)
    }
}
