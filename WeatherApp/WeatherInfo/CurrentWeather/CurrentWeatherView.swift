// CurrentWeatherView.swift

import UIKit

@IBDesignable class CurrentWeatherView: NibLoadedView {
    // MARK: Outlets
    @IBOutlet private weak var currentTimeView: TextLineView!
    @IBOutlet private weak var sunriseView: TextLineView!
    @IBOutlet private weak var sunsetView: TextLineView!
    @IBOutlet private weak var temperatureView: TextLineView!
    @IBOutlet private weak var feelsLikeView: TextLineView!
    @IBOutlet private weak var pressureView: TextLineView!
    @IBOutlet private weak var humidityView: TextLineView!
    @IBOutlet private weak var cloudinessView: TextLineView!
    @IBOutlet private weak var middayUVIndexView: TextLineView!
    @IBOutlet private weak var averageVisibilityView: TextLineView!
    @IBOutlet private weak var windSpeedView: TextLineView!
    @IBOutlet private weak var windGustView: TextLineView!
    @IBOutlet private weak var windDirectionView: TextLineView!
    @IBOutlet private weak var rainOrSnowView: TextLineView!
}

extension CurrentWeatherView {
    // MARK: Public interface
    public func fill(with model: CurrentWeather) {
        self.currentTimeView.text = Date(timeIntervalSince1970: model.dt).fullDate()
        self.sunriseView.text = Date(timeIntervalSince1970: model.sunrise).fullDate()
        self.sunsetView.text = Date(timeIntervalSince1970: model.sunset).fullDate()
        self.temperatureView.text = "\(model.temp)"
        self.feelsLikeView.text = "\(model.feels_like)"
        self.pressureView.text = "\(model.pressure)"
        self.humidityView.text = "\(model.humidity)"
        self.cloudinessView.text = "\(model.clouds)"
        self.middayUVIndexView.text = "\(model.uvi)"
        self.averageVisibilityView.text = "\(model.visibility)"
        self.windSpeedView.text = "\(model.wind_speed)"
        self.windGustView.text = "\(model.wind_gust ?? 0)"
        self.windDirectionView.text = "\(model.wind_deg)"
        self.rainOrSnowView.text = "\(model.weather.map {$0.description}.joined(separator: ", "))"
    }
}
