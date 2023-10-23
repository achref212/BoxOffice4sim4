//
//  ViewController.swift
//  BoxOffice4sim4
//
//  Created by Mac Mini 9 on 23/10/2023.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource{
    let tableau = ["El Camino","Extraction","Project Power","Six Underground","Spenser Confidential","The Irishman"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableau.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mItem = collectionView.dequeueReusableCell(withReuseIdentifier: "mCell", for: indexPath)
        let contentView = mItem.contentView
        let label = contentView.viewWithTag(2) as! UILabel
        label.text = tableau[indexPath.row]
        let img = contentView.viewWithTag(1) as! UIImageView
        img.image = UIImage(named: tableau[indexPath.row])
        return mItem
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = tableau[indexPath.row]
        performSegue(withIdentifier: "mSegue", sender: movie)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mSegue" {
            let name = sender as! String
            print(name)
            let destination = segue.destination as! DetailsViewController
            destination.movieName = name
        }
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }




}

