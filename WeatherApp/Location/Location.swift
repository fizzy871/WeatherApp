// Location.swift

import Foundation
import CoreLocation

class Location: NSObject {
    // MARK: Private variables
    private static var instances = [Location]()
    private let manager = CLLocationManager()
    private var completion: ((Result<CLLocation, Error>) -> Void)?
}

extension Location {
    // MARK: Private interface
    private func react(to status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            self.manager.requestWhenInUseAuthorization()
        case .restricted:
            self.completion?(.failure(.restricted))
            self.manager.stopUpdatingLocation()
            Self.instances.removeAll(where: {$0 === self})
        case .denied:
            self.completion?(.failure(.denied))
            self.manager.stopUpdatingLocation()
            Self.instances.removeAll(where: {$0 === self})
        case .authorizedAlways, .authorizedWhenInUse:
            self.manager.startUpdatingLocation()
        default: break
        }
    }
}

extension Location {
    // MARK: Public interface
    public func get(_ completion: @escaping (Result<CLLocation, Error>) -> Void) {
        self.completion = completion
        self.manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        self.manager.delegate = self
        Self.instances.append(self)
        self.react(to: CLLocationManager.authorizationStatus())
    }
}

extension Location: CLLocationManagerDelegate {
    // MARK: CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        self.completion?(.failure(.coreLocationError(error)))
        self.manager.stopUpdatingLocation()
        Self.instances.removeAll(where: {$0 === self})
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.sorted(by: {$0.timestamp > $1.timestamp}).first {
            self.completion?(.success(location))
            self.manager.stopUpdatingLocation()
            Self.instances.removeAll(where: {$0 === self})
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.react(to: status)
    }
}

extension Location {
    // MARK: Nested objects
    enum Error: Swift.Error {
        case restricted
        case denied
        case coreLocationError(Swift.Error)
    }
}
