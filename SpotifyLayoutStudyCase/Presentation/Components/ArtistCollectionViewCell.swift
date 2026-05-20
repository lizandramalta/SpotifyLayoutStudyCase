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
}
