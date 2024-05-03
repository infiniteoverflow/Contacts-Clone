//
//  UILabel+Extension.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 29/04/24.
//

import UIKit

extension UILabel {
    func addCharactersSpacing(spacing: CGFloat) {
        guard let text else {
            return
        }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, text.count-1))
        self.attributedText = attributedString
    }
}
