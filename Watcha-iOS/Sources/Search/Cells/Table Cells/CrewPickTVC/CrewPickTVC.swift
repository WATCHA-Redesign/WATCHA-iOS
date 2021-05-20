//
//  CrewPickTVC.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class CrewPickTVC: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet var collectionView: UICollectionView!
    var models = [CrewCollectionModel]()
    
    
    //MARK:- Variable
    static let identifier = "CrewPickTVC"
    static var Nib = UINib(nibName: "CrewPickTVC", bundle: nil)
    
    
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
        collectionView.register(CrewPickCVC.Nib, forCellWithReuseIdentifier: CrewPickCVC.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setData() {
        
        models.append(contentsOf: [
            
            CrewCollectionModel(title: "배우의 영상화보 모음집", pickerName: "푸른바다"),
            CrewCollectionModel(title: "죽기전에 꼭 봐야 할 영화 컬렉션", pickerName: "mignon"),
            CrewCollectionModel(title: "월요병 퇴치해주는 힐링 드라마", pickerName: "현경")
        
            
        ])
        
    }
    
    //MARK:- Function
    
}


//MARK:- extension
extension CrewPickTVC: UICollectionViewDelegate {
    
    
}

extension CrewPickTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CrewPickCVC", for: indexPath) as? CrewPickCVC else { return UICollectionViewCell() }
        
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    
    
}

extension CrewPickTVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 351, height: 22)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

}
