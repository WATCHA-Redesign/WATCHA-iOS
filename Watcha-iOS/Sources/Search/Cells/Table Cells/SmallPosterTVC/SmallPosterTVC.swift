//
//  SmallPosterTVC.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class SmallPosterTVC: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet var collectionView: UICollectionView!
    
    
    //MARK:- Variable
    static let identifier = "SmallPosterTVC"
    static var Nib = UINib(nibName: "SmallPosterTVC", bundle: nil)
    var models = [SmallPosterModel]()
    
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .watcha_bg
        collectionView.register(SmallPosterCVC.Nib, forCellWithReuseIdentifier: SmallPosterCVC.identifier)
        
        
    }
    
    //MARK:- Function
    //여기서 데이터를 넣는게 좋은건가? 메인 뷰컨에서 넣어야 하나?
    func setData() {
        models.append(contentsOf: [
            
            SmallPosterModel(imageName: "cardSearchSmall1Ios"),
            SmallPosterModel(imageName: "cardSearchSmall2Ios"),
            SmallPosterModel(imageName: "cardSearchSmall3Ios"),
            SmallPosterModel(imageName: "cardSearchSmall4Ios"),
            SmallPosterModel(imageName: "cardSearchSmall5Ios"),
            
        ])
        
    }
    
}


//MARK:- extension
extension SmallPosterTVC: UICollectionViewDelegate {
    
    
}

extension SmallPosterTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallPosterCVC", for: indexPath) as? SmallPosterCVC else { return UICollectionViewCell() }
        
        cell.configure(with: models[indexPath.row])
        return cell
        
    }
    
}

extension SmallPosterTVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 105)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
}
