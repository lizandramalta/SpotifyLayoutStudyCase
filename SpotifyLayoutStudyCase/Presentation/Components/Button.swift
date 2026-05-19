//
//  Button.swift
//  SpotifyLayoutStudyCase
//
//  Created by Lizandra Malta on 17/05/26.
//

import UIKit

final class Button: UIButton {
    
    private lazy var iconComponent = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelComponent = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let baseFont =
            UIFont(name: "AvenirNext-Bold", size: 16) ??
            UIFont.systemFont(ofSize: 16, weight: .bold)
        
        label.font = UIFontMetrics(forTextStyle: .callout)
            .scaledFont(for: baseFont)
        
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(label: String, backgroundColor: UIColor, foregroundColor: UIColor, icon: UIImage? = nil, borderColor: UIColor? = nil, borderWidth: CGFloat = 0){
        super.init(frame: .zero)
        
        setupStyle(backgroundColor: backgroundColor, foregroundColor: foregroundColor, borderColor: borderColor, borderWidth: borderWidth)
        setupContent(label: label, icon: icon)
        setupView()
        setupConstraints()
    }
    
    private func setupStyle(backgroundColor: UIColor, foregroundColor: UIColor, borderColor: UIColor? = nil, borderWidth: CGFloat = 0){
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 24
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        
        labelComponent.textColor = foregroundColor
        iconComponent.tintColor = foregroundColor
    }
    
    private func setupContent(label: String, icon: UIImage?){
        labelComponent.text = label
        iconComponent.image = icon
        self.accessibilityLabel = label
    }
    
    private func setupView(){
        addSubview(iconComponent)
        addSubview(labelComponent)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            // Self
            heightAnchor.constraint(equalToConstant: 49),
            
            // Icon
            iconComponent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconComponent.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconComponent.widthAnchor.constraint(equalToConstant: 20),
            iconComponent.heightAnchor.constraint(equalToConstant: 20),
            
            // Label
            labelComponent.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelComponent.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
