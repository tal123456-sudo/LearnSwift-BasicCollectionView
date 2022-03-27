//
//  ViewController.swift
//  collectionView
//
//  Created by Talha Varol on 27.03.2022.
//

import UIKit

class ViewController: UIViewController{
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    var filmlerList = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        tasarim()
        
        let f1 = Filmler(filmId: 1, filmBaslik: "Django", filmResimAdi: "django", filmFiyat: 55.6)
        let f2 = Filmler(filmId: 2, filmBaslik: "Inception", filmResimAdi: "inception", filmFiyat: 35.6)
        let f3 = Filmler(filmId: 3, filmBaslik: "Interstallar", filmResimAdi: "interstellar", filmFiyat: 25.6)
        let f4 = Filmler(filmId: 4, filmBaslik: "The Pianist", filmResimAdi: "thepianist", filmFiyat: 65.6)
        let f5 = Filmler(filmId: 5, filmBaslik: "Hateful Leight", filmResimAdi: "thehatefuleight", filmFiyat: 45.6)
        let f6 = Filmler(filmId: 6, filmBaslik: "Anadoluda", filmResimAdi: "birzamanlaranadoluda", filmFiyat: 85.6)
        filmlerList.append(f1)
        filmlerList.append(f2)
        filmlerList.append(f3)
        filmlerList.append(f4)
        filmlerList.append(f5)
        filmlerList.append(f6)
        
    }

    
    
  private func tasarim(){
        let tasarim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.collectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
      tasarim.itemSize = CGSize(width: (genislik-30) / 2, height: ((genislik - 30) / 2) * 1.8 )
        
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        collectionView.collectionViewLayout = tasarim
    }
    
  
    
    
}
    
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, HucreProtokol{
    func sepeteEkle(indexPath: IndexPath) {
        let film =  filmlerList[indexPath.row]
        print("\(film.filmBaslik!) filmi sepete eklendi")
    }
    
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return filmlerList.count        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let film =  filmlerList[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fılmHucre", for: indexPath)as! HucreCollectionViewCell
            cell.nameLabel.text = film.filmBaslik!
            cell.priceLabel.text = "\(film.filmFiyat!) TL"
            cell.filmImage.image = UIImage(named: film.filmResimAdi!)
            cell.hucreProtocol = self
            cell.indexPath = indexPath
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.lightGray.cgColor
            
            return cell
        }
        

        
        
    }



