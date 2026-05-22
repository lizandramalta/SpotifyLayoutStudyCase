//
//  ArtistCollectionViewCell.swift
//  SpotifyLayoutStudyCase
//
//  Created by Nicole Dias on 19/05/26.
//

import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ArtistCollectionViewCell"
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cardImage.layer.cornerRadius = cardImage.frame.width / 2
        cardImage.clipsToBounds = true
        cardImage.contentMode = .scaleAspectFill
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDynamicType()
    }
    
    private func setupDynamicType() {
        
        if let customFont = UIFont(name: "AvenirNext-Bold", size: 13) {
            textLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        } else {
            textLabel.font = .preferredFont(forTextStyle: .body)
        }
        
        textLabel.adjustsFontForContentSizeCategory = true
        
        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.7
    }
    
}
