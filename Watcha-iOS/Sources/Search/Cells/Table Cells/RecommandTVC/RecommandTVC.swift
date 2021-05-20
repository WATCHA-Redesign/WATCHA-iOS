//
//  RecommandTVC.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class RecommandTVC: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet var collectionView: UICollectionView!
    
    
    //MARK:- Variable
    static let identifier = "RecommandTVC"
    static var Nib = UINib(nibName: "RecommandTVC", bundle: nil)
    var models = [PosterModel]()
    
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewSetting()
        setData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //MARK:- IBAction
    
    
    
    //MARK:- default Setting Function Part
    func collectionViewSetting() {
        
        collectionView.backgroundColor = .watcha_bg
        collectionView.register(RecommandCVC.Nib, forCellWithReuseIdentifier: RecommandCVC.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setData() {
        
        models.append(contentsOf: [
        
            PosterModel(imageName: "cardSearchBigAndroid1",
                        title: "",
                        subtitle: ""),
        
            PosterModel(imageName: "cardSearchBigIos22",
                        title: "",
                        subtitle: "")
        ])
        
    }
    
    //MARK:- Function
    
}


//MARK:- extension
extension RecommandTVC: UICollectionViewDelegate {
    
    
}

extension RecommandTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCVC", for: indexPath) as? RecommandCVC
        else { return UICollectionViewCell()}
        
        cell.configure(with: models[indexPath.row])
    
        return cell
    }
    
    
    
}

extension RecommandTVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 234, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    
}

