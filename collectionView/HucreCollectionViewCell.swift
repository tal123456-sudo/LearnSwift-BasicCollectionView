//
//  HucreCollectionViewCell.swift
//  collectionView
//
//  Created by Talha Varol on 27.03.2022.
//

import UIKit

protocol HucreProtokol{
    func sepeteEkle(indexPath:IndexPath)
}

class HucreCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    
    
    var hucreProtocol:HucreProtokol?
    var indexPath:IndexPath?
    
    
    @IBAction func addButton(_ sender: Any) {
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
        
    }
}
