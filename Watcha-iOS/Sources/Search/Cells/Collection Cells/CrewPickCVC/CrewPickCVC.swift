//
//  CrewPickCVC.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class CrewPickCVC: UICollectionViewCell {

    @IBOutlet var pickLabel: UILabel!
    
    static let identifier = "CrewPickCVC"
    static var Nib = UINib(nibName: "CrewPickCVC", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with model: CrewCollectionModel) {
        pickLabel.attributedText = makeAttributedStrings(with: model)
    }
    
    func makeAttributedStrings(with model: CrewCollectionModel) -> NSAttributedString {
        
        let titleAttribute = [ NSAttributedString.Key.font: UIFont.collection_title,
                               NSAttributedString.Key.foregroundColor: UIColor.watcha_white ]
        let crewAttribute = [ NSAttributedString.Key.font: UIFont.collection_crew,
                              NSAttributedString.Key.foregroundColor: UIColor.watcha_lightgray]
        
        let titleString = NSMutableAttributedString(string: model.title, attributes: titleAttribute)
        let crewString = NSMutableAttributedString(string: " | \(model.whosPick)님 Pick!", attributes: crewAttribute)
        
        titleString.append(crewString)

        return titleString
        
    }
    
    func setStyles(whosPick: String) {
        pickLabel.font = .collection_title
        pickLabel.textColor = .watcha_white
        
        //같은 String 내에서 색깔, 폰트 다르게
        let text = pickLabel.text!
        let targetText = " | \(whosPick)님 Pick!"
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.foregroundColor,
                                      value: UIColor.watcha_lightgray,
                                      range: (text as NSString).range(of: targetText))
        
        attributedString.addAttribute(.font,
                                      value: UIFont.collection_crew,
                                      range: (text as NSString).range(of: targetText))

    }

}
