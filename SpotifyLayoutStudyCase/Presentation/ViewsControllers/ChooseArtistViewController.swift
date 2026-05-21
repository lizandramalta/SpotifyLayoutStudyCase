//
//  ChooseArtistViewController.swift
//  SpotifyLayoutStudyCase
//
//  Created by Nicole Dias on 19/05/26.
//
import UIKit

struct Artist {
    let name: String
    let image: String
}

class ChooseArtistViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var searchSymbol: UIImageView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let artists: [Artist] = [
        Artist(name: "Billie Eilish", image: "billie_eilish"),
        Artist(name: "Kanye West", image: "kanye_west"),
        Artist(name: "Ariana Grande", image: "ariana_grande"),
        Artist(name: "Lana Del Rey", image: "lana_del_rey"),
        Artist(name: "Olivia Rodrigo", image: "olivia_rodrigo"),
        Artist(name: "Avril Lavigne", image: "avril_lavigne"),
        Artist(name: "Rihanna", image: "rihanna"),
        Artist(name: "Radiohead", image: "radiohead"),
        Artist(name: "Chappell Roan", image: "chappell_roan"),
        Artist(name: "Katy Perry", image: "katy_perry"),
        Artist(name: "Beyoncé", image: "beyonce"),
        Artist(name: "The Script", image: "the_script"),
        Artist(name: "Taylor Swift", image: "taylor_swift"),
        Artist(name: "Justin Bieber", image: "justin_bieber"),
        Artist(name: "Selena Gomez", image: "selena_gomez")
        
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let customFont = UIFont(name: "AvenirNext-Bold", size: 16) else { return }
        guard let customFont2 = UIFont(name: "AvenirNext-Medium", size: 14) else { return }
        
        //dynamic type 
        label1.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        label1.adjustsFontForContentSizeCategory = true
        searchField.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont2)
        searchField.adjustsFontForContentSizeCategory = true
        
        //registra o XIB na Collection View
        let nib = UINib(nibName: "ArtistCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ArtistCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        searchField.layer.cornerRadius = 5
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: searchField.frame.height))

        searchField.leftView = paddingView
        searchField.leftViewMode = .always
        
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        
        
        searchSymbol.preferredSymbolConfiguration = config
        
        searchSymbol.contentMode = .center
        
        addGradient()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCollectionViewCell.identifier, for: indexPath) as! ArtistCollectionViewCell
        
        let currentArtist = artists[indexPath.row]
        
        cell.textLabel.text = currentArtist.name
        cell.textLabel.textColor = .white
        cell.textLabel.textAlignment = .center
        
        cell.cardImage.image = UIImage(named: currentArtist.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 110, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    private let gradientLayer = CAGradientLayer()
    
    private func addGradient(){
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.locations = [0.75, 1.0]
        view.layer.addSublayer(gradientLayer)
    }
    
    @IBAction func button1(_ sender: Any) {
    }
    
    
}
