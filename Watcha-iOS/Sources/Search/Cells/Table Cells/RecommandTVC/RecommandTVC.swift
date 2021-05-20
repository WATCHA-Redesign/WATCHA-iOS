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
        
            PosterModel(imageName: "cardSearchBigImg1Ios",
                        title: "당신이 좋아할 컨텐츠",
                        subtitle: "그녀, 슬기로운 의사생활, 기생충, \n줄무늬 파자마를 입은 소년, 인턴 등"),
        
            PosterModel(imageName: "cardSearchBigImgs2",
                        title: "시도해보는 새로운",
                        subtitle: "맨 인 블랙: 인터내셔널, 쾌걸춘향, \n트루 디텍티브 시즌3, 붉은 수수밭 등")
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

