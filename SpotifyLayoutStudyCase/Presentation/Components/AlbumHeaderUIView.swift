//
//  AlbumHeaderUIView.swift
//  SpotifyLayoutStudyCase
//
//  Created by Ana Luisa Teixeira Coleone Reis on 19/05/26.
//

import UIKit

class AlbumHeaderUIView: UIView {
    
    private let albumCoverImageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "albumCoverImage")
        
        return image
    }()
    
    private let bandCoverImageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "bandCoverImage")
        image.layer.cornerRadius = 15
        
        return image
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "1(Remastered)"
        
        let font = UIFont.preferredFont(forTextStyle: .title1)
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
        
        label.textColor = .white
        
        return label
    }()
    
    private let albumInfosLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Album • 2000"
        
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = .gray100
        
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        
        let config = UIImage.SymbolConfiguration(
            pointSize: 20,
            weight: .bold
        )
        
        let image = UIImage(
            systemName: "play.fill",
            withConfiguration: config
        )
    
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        button.backgroundColor = .accent
        button.layer.cornerRadius = 28
                
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        
        let config = UIImage.SymbolConfiguration(
            pointSize: 19,
            weight: .regular
        )
        
        let image = UIImage(
            systemName: "heart",
            withConfiguration: config
        )
        
        button.setImage(image, for: .normal)
        button.tintColor = .gray100
                
        return button
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        
        let config = UIImage.SymbolConfiguration(
            pointSize: 19,
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(albumCoverImageView)
        addSubview(albumNameLabel)
        addSubview(bandNameLabel)
        addSubview(bandCoverImageView)
        addSubview(albumInfosLabel)
        addSubview(playButton)
        addSubview(saveButton)
        addSubview(downloadButton)
        addSubview(moreInfosButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupConstraints() {
        
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bandNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bandCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumInfosLabel.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        moreInfosButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            // Album Cover
            albumCoverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            albumCoverImageView.centerXAnchor.constraint(equalTo: centerXAnchor),

            albumCoverImageView.widthAnchor.constraint(equalToConstant: 235),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: 235),

            // Album Name
            albumNameLabel.topAnchor.constraint(
                equalTo: albumCoverImageView.bottomAnchor,
                constant: 45
            ),

            albumNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),

//            albumNameLabel.trailingAnchor.constraint(
//                equalTo: trailingAnchor,
//                constant: -20
//            ),

            // Band Cover
            bandCoverImageView.topAnchor.constraint(
                equalTo: albumNameLabel.bottomAnchor,
                constant: 12
            ),

            bandCoverImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 19
            ),

            bandCoverImageView.widthAnchor.constraint(equalToConstant: 23),
            bandCoverImageView.heightAnchor.constraint(equalToConstant: 23),

            // Band Name
            bandNameLabel.centerYAnchor.constraint(
                equalTo: bandCoverImageView.centerYAnchor
            ),

            bandNameLabel.leadingAnchor.constraint(
                equalTo: bandCoverImageView.trailingAnchor,
                constant: 7
            ),

            // Album Infos
            albumInfosLabel.topAnchor.constraint(
                equalTo: bandCoverImageView.bottomAnchor,
                constant: 7
            ),

            albumInfosLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            
            albumInfosLabel.centerYAnchor.constraint(
                equalTo: playButton.centerYAnchor
            ),

//            albumInfosLabel.trailingAnchor.constraint(
//                equalTo: trailingAnchor,
//                constant: -20
//            ),

            // Play Button
            playButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),

            playButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -40
            ),

            playButton.widthAnchor.constraint(equalToConstant: 56),
            playButton.heightAnchor.constraint(equalToConstant: 56),

            // Save Button
            saveButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 9
            ),
            
            saveButton.topAnchor.constraint(
                equalTo: albumInfosLabel.bottomAnchor,
                constant: -2
            ),

//            saveButton.centerYAnchor.constraint(
//                equalTo: playButton.bottomAnchor
//            ),

            saveButton.widthAnchor.constraint(equalToConstant: 44),
            saveButton.heightAnchor.constraint(equalToConstant: 44),

            // Download Button
            downloadButton.leadingAnchor.constraint(
                equalTo: saveButton.trailingAnchor,
                constant: 16
            ),
            
            downloadButton.leftAnchor.constraint(
                equalTo: saveButton.rightAnchor,
                constant: -5
            ),

            downloadButton.centerYAnchor.constraint(
                equalTo: saveButton.centerYAnchor
            ),

            downloadButton.widthAnchor.constraint(equalToConstant: 44),
            downloadButton.heightAnchor.constraint(equalToConstant: 44),
            
            // More Infos Button
            moreInfosButton.centerYAnchor.constraint(equalTo: downloadButton.centerYAnchor),
            
            moreInfosButton.leadingAnchor.constraint(
                equalTo: downloadButton.leadingAnchor,
                constant: 46
            )
        ])
    }

}

#Preview {
    AlbumViewController()
}

