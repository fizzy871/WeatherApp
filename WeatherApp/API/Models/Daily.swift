// Daily.swift

import Foundation

struct Daily: Codable {
    let dt: Double
    let sunrise: Double
    let sunset: Double
    let temp: Temperature
    let feels_like: FeelsLike
    let pressure: Float
    let humidity: Float
    let dew_point: Float
    let wind_speed: Float
    let wind_deg: Float
    let weather: [Weather]
    let clouds: Float
    let pop: Float
    let rain: Float?
    let snow: Float?
    let uvi: Float
}
