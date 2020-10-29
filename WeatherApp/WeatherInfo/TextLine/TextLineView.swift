// TextLineView.swift

import UIKit

@IBDesignable class TextLineView: NibLoadedView {
    // MARK: Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textLabel: UILabel!
    // MARK: Public variables
    @IBInspectable public var title: String? {
        set { self.titleLabel.text = newValue }
        get { return self.titleLabel.text }
    }
    @IBInspectable public var text: String? {
        set { self.textLabel.text = newValue }
        get { return self.textLabel.text }
    }
    
    // MARK: Lifecycle
    open override func didLoadFromNib() {
        self.title = nil
        self.text = nil
    }
}
