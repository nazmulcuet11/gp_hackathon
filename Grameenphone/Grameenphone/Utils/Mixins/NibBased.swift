import UIKit

/// Provide mixins for easy loading of uiview from nib file
protocol NibBased {
    /// Name of the nib file from which UIView will be instantiated
    /// Default implementation assumes nib file name is same as Target Class name
    /// Must override this property if nib name is different from UIView's name
    static var nibName: String { get }

    /// This method instantiate a uiview from nib file
    /// Don't implement this method. If you implement `nibName` correctly this method should work as is
    /// - Returns: UIView
    static func instantiate() -> Self
}

extension NibBased where Self: UIView {

    static var nibName: String {
        return "\(Self.self)"
    }

    static func instantiate() -> Self  {
        let nib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        guard let view = nib?.first as? Self else {
            fatalError("Can't load view \(Self.self) from nib \(nibName)")
        }
        return view
    }
}
