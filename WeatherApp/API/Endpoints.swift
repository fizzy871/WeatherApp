// Endpoints.swift

import Foundation

enum Endpoints {
    // MARK: Private variables
    private static let apiKey = "4a433844c36527ab6893e421d651287c"
    
    case onecall(lat: Double, lon: Double)
    
    // MARK: Public interface
    public func url() -> URL {
        switch self {
        case .onecall(let lat, let lon):
            return URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&appid=\(Self.apiKey)")!
        }
    }
}
