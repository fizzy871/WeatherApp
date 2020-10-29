// Hourly.swift

import Foundation

struct Hourly: Codable {
    let dt: Double
    let temp: Float
    let feels_like: Float
    let pressure: Float
    let humidity: Float
    let dew_point: Float
    let clouds: Float
    let visibility: Float
    let wind_speed: Float
    let wind_deg: Float
    let weather: [Weather]
    let pop: Float
}
