//
//  DirectorTVC.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class DirectorTVC: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet var collectionView: UICollectionView!
    var models = [NameModel]()
    
    //MARK:- Variable
    static let identifier = "DirectorTVC"
    static var Nib = UINib(nibName: "DirectorTVC", bundle: nil)
    
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
        collectionView.register(DirectorCVC.Nib, forCellWithReuseIdentifier: DirectorCVC.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowLayout: UICollectionViewFlowLayout = LeftAlignedCollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 6
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 45)
        collectionView.collectionViewLayout = flowLayout
        
    }
    
    func setData() {
        
        models.append(contentsOf: [
        
            NameModel(name: "봉준호", isDirector: true),
            NameModel(name: "윤여정", isDirector: false),
            NameModel(name: "팀버튼", isDirector: true),
            NameModel(name: "박찬욱", isDirector: false),
            NameModel(name: "서현경", isDirector: false),
            NameModel(name: "로버트패틴슨", isDirector: false),
            NameModel(name: "크리스토퍼놀란", isDirector: true),
            NameModel(name: "김초희", isDirector: true),
            NameModel(name: "이병헌", isDirector: true),
            NameModel(name: "김민영", isDirector: false),
            NameModel(name: "앤해서웨이", isDirector: false),
            NameModel(name: "엠마왓슨", isDirector: false),
            NameModel(name: "변요한", isDirector: false),
            NameModel(name: "김은숙", isDirector: true),
            NameModel(name: "김순옥", isDirector: true),
        
        
        ])
        
    }
    
    //MARK:- Function
    
}


//MARK:- extension
extension DirectorTVC: UICollectionViewDelegate {
    
    
}

extension DirectorTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DirectorCVC", for: indexPath) as? DirectorCVC else { return UICollectionViewCell() }
        
        cell.configure(with: models[indexPath.row])
        
        return cell
    }
    
    
}

extension DirectorTVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let heightOfButton = frame.height
        let size = CGSize(width: 100, height: heightOfButton)
        let attribute = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16) ]
        let estimatedFrame = NSString(string: models[indexPath.row].name).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
        
        return CGSize(width: estimatedFrame.width + 30, height: 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return -5
        
    }
    
    
    class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
      override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
          if layoutAttribute.representedElementCategory == .cell {
            if layoutAttribute.frame.origin.y >= maxY {
              leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
          }
        }
        return attributes
      }
    }
    
}

