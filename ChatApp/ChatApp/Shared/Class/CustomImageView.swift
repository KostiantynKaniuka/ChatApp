//
//  CustomImageView.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 15.02.2023.
//

import UIKit

class CustomImageView: UIImageView {
    init(image: UIImage? = nil, width: CGFloat? = nil, height: CGFloat? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat = 0) {
        super.init(frame: .zero)
        contentMode = .scaleAspectFit
        layer.cornerRadius = cornerRadius
        
        if let image = image {
            self.image = image
        }
        
        if let widh = width {
            setWidth(widh)
        }
        
        if let height = height {
            setHeight(height)
        }
        
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
