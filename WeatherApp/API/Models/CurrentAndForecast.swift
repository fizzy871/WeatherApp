// CurrentAndForecast.swift

import Foundation

struct CurrentAndForecast: Codable {
    let lat: Float
    let lon: Float
    let timezone: String
    let timezone_offset: Int
    let current: CurrentWeather
    let minutely: [Minutely]
    let hourly: [Hourly]
    let daily: [Daily]
}
