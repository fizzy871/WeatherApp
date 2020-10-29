// WeatherInfoViewController.swift

import UIKit
import CoreLocation

class WeatherInfoViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var currentWeatherView: CurrentWeatherView!
}

extension WeatherInfoViewController {
    // MARK: Actions
    @IBAction private func reload() {
        let completion: (Result<CurrentAndForecast, Error>) -> Void = {[weak self] result in
            switch result {
            case .success(let currentAndForecast):
                DispatchQueue.onMain {
                    self?.currentWeatherView.fill(with: currentAndForecast.current)
                }
            case .failure(let error):
                switch error {
                case .apiError(let aError): self?.show(error: aError)
                case .locationError(let lError):
                    switch lError {
                    case .denied: self?.show(message: "Location denied")
                    case .restricted: self?.show(message: "Location restricted")
                    case .coreLocationError(let clError): self?.show(error: clError)
                    }
                }
            }
        }
        Location().get { (result) in
            switch result {
            case .success(let location):
                API.shared.currentAndForecastWeater(lat: location.coordinate.latitude, lon: location.coordinate.longitude) { (result) in
                    completion(result.mapError { Error.apiError($0) } )
                }
            case .failure(let error): completion(.failure(.locationError(error)))
            }
        }
    }
}

extension WeatherInfoViewController {
    // MARK: Nested objects
    enum Error: Swift.Error {
        case locationError(Location.Error)
        case apiError(Swift.Error)
    }
}
