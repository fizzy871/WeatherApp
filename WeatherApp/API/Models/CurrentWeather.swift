// CurrentWeather.swift

import Foundation

struct CurrentWeather: Codable {
    let dt: Double
    let sunrise: Double
    let sunset: Double
    let temp: Float
    let feels_like: Float
    let pressure: Float
    let humidity: Float
    let dew_point: Float
    let uvi: Float
    let clouds: Float
    let visibility: Float
    let wind_speed: Float
    let wind_deg: Float
    let wind_gust: Float?
    let weather: [Weather]
}
