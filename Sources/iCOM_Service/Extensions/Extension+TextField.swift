//
//  Extension+TextField.swift
//  DemoX
//
//  Created by Nam Nguyễn on 18/11/2022.
//

import UIKit

protocol DesignableTextFieldDelegate: UITextFieldDelegate {
    func textFieldIconClicked(btn:UIButton)
}

@IBDesignable
public class DesignableTextField: UITextField {

    //Delegate when image/icon is tapped.
    private var myDelegate: DesignableTextFieldDelegate? {
        get { return delegate as? DesignableTextFieldDelegate }
    }

    @objc func buttonClicked(btn: UIButton){
        self.myDelegate?.textFieldIconClicked(btn: btn)
    }

    //Padding images on left
    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += padding
        return textRect
    }

    //Padding images on Right
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= padding
        return textRect
    }

    @IBInspectable var padding: CGFloat = 0
    @IBInspectable var leadingImage: UIImage? { didSet { updateView() }}
    @IBInspectable var color: UIColor = UIColor.lightGray { didSet { updateView() }}
    @IBInspectable var imageColor: UIColor = .gray { didSet { updateView() }}
    @IBInspectable var rtl: Bool = false { didSet { updateView() }}

    func updateView() {
        rightViewMode = UITextField.ViewMode.never
        rightView = nil
        rightViewMode = UITextField.ViewMode.always
        rightView = nil

        if let image = leadingImage {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
            button.tintColor = imageColor

            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self, action: #selector(buttonClicked(btn:)), for: UIControl.Event.touchDown)
            button.isUserInteractionEnabled = true

                rightViewMode = UITextField.ViewMode.always
                rightView = button
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
