// NibLoadedView.swift

import UIKit

open class NibLoadedView: UIView {
    var nibName: String { return String(describing: Self.self) }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibView()
        self.didLoadFromNib()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibView()
        self.didLoadFromNib()
    }
    private func loadNibView() {
        let view = UINib(nibName: self.nibName, bundle: Bundle(for: Self.self)).instantiate(withOwner: self, options: nil).first as! UIView
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    open func didLoadFromNib() {
        
    }
}
