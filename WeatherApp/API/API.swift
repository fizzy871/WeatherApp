// API.swift

import Foundation

class API {
    // MARK: Private variables
    private let session = URLSession(configuration: .default)
    // MARK: Public variables
    public static let shared = API()
}

extension API {
    // MARK: Public interface
    public func currentAndForecastWeater(lat: Double, lon: Double, completion: @escaping (Result<CurrentAndForecast, Swift.Error>) -> Void) {
        self.session.dataTask(with: Endpoints.onecall(lat: lat, lon: lon).url()) { (data, response, error) in
            let result = Result<Data, Swift.Error> { () -> Data in
                try error?.throwError()
                guard let data = data else { throw FatalError(errorDescription: "No data from API endpoint 'onecall'") }
                return data
            }.mapError { (error) -> Error in
                Error.networkError(error)
            } .flatMap { (data) -> Result<CurrentAndForecast, Swift.Error> in
                    return Result<CurrentAndForecast, Swift.Error> { () -> CurrentAndForecast in
                        try JSONDecoder().decode(CurrentAndForecast.self, from: data)
                    }.mapError { (error) -> Error in
                        Error.decodingError(error)
                    }
            }
            completion(result)
        }.resume()
    }
}
