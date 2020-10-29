// DispatchQueue+Helper.swift

import Foundation

extension DispatchQueue {
    static func onMain(_ closure: @escaping () -> ()) {
        if Thread.current.isMainThread {
            closure()
        } else {
            Self.main.async(execute: closure)
        }
    }
}
