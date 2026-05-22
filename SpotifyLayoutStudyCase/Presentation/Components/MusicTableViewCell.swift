//
//  MusicViewTableViewCell.swift
//  SpotifyLayoutStudyCase
//
//  Created by Ana Luisa Teixeira Coleone Reis on 19/05/26.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    private let musicNameLabel: UILabel = {
        let label = UILabel()
        
        let font = UIFont.preferredFont(forTextStyle: .callout)
        label.font = UIFont.boldSystemFont(ofSize: font.pointSize)
        
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        
        return label
    }()
    
    private let bandNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "The Beatles"
        
        let font = UIFont.preferredFont(forTextStyle: .footnote)
        label.font = UIFont.boldSystemFont(ofSize: font.pointSize)
        
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .gray100
        
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        
        let config = UIImage.SymbolConfiguration(
            pointSize: 14,
            weight: .bold
        )
        
        let image = UIImage(
            systemName: "arrow.down.circle.fill",
            withConfiguration: config
        )
        
        button.setImage(image, for: .normal)
        button.tintColor = .accent
                
        return button
    }()
    
    private let moreInfosButton: UIButton = {
        let button = UIButton()
                        
        let config = UIImage.SymbolConfiguration(
            pointSize: 19,
            weight: .bold
        )
        
        button.setTitle("•••", for: .normal)
        button.setTitleColor(.gray100, for: .normal)
                
        return button
    }()
    
    static let identifier = "MusicTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(musicNameLabel)
        addSubview(bandNameLabel)
        addSubview(downloadButton)
        addSubview(moreInfosButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupConstraints() {
        
        musicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bandNameLabel.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        moreInfosButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Music Name
            musicNameLabel.topAnchor.constraint(equalTo: topAnchor),
            
            musicNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            
            // Band Name
            bandNameLabel.topAnchor.constraint(
                equalTo: musicNameLabel.bottomAnchor,
                constant: 3),
            
            bandNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 36),
            
            bandNameLabel.centerYAnchor.constraint(equalTo: downloadButton.centerYAnchor),
            
            // Download Button
            downloadButton.topAnchor.constraint(
                equalTo: musicNameLabel.bottomAnchor,
                constant: 3
            ),
            
            downloadButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16),
            
            // More Infos Button
            moreInfosButton.topAnchor.constraint(
                equalTo: musicNameLabel.bottomAnchor,
                constant: -15
            ),
            
            moreInfosButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -15
            )
        ])
    }
    
    func setupCell(musicName: String) {
        musicNameLabel.text = musicName
    }

}


