// MinutePrecipitationView.swift

import UIKit

@IBDesignable class MinutePrecipitationView: NibLoadedView {
    // MARK: Outlets
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var precipitationLabel: UILabel!
    // MARK: Public variables
    @IBInspectable public var time: String? {
        set { self.timeLabel.text = newValue }
        get { return self.timeLabel.text }
    }
    @IBInspectable public var precipitation: String? {
        set { self.precipitationLabel.text = newValue }
        get { return self.precipitationLabel.text }
    }
}
