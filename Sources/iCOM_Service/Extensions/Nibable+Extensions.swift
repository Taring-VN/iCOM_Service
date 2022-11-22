//
//  Nibable+Extensions.swift
//  DemoX
//
//  Created by Nam Nguyễn on 19/11/2022.
//

import UIKit


public protocol Nibable {

    static var nib: UINib { get }
    static var toNibName: String { get }
}

extension Nibable {
    public static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }

    public static var toNibName: String {
        return String(describing: Self.self)
    }
}

extension UIViewController: Nibable { }
extension UIView: Nibable { }



public extension Nibable where Self: UIView {
  /**
   Returns a `UIView` object instantiated from nib
   - returns: A `NibLoadable`, `UIView` instance
   */
  static func loadFromNib() -> Self {
    guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
      fatalError("The nib \(nib) expected its root view to be of type \(self)")
    }
    return view
  }
}
