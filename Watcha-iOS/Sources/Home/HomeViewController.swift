//
//  HomeViewController.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK:- IBOutlet Part
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var mainPosterCollectionView: UICollectionView!
    @IBOutlet weak var firstSmallVideoCollectionView: UICollectionView!
    @IBOutlet weak var bigVideoCollectionView: UICollectionView!
    @IBOutlet weak var secondSmallVideoCollectionView: UICollectionView!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var mainTopView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var firstSmallVideoLabel: UILabel!
    @IBOutlet weak var secondSmallVideoLabel: UILabel!
    
    var mainPosterList: [PosterModel] = []
    var firstSmallVideoList: [SmallVideoModel] = []
    var bigVideoList: [BigVideoModel] = []
    var secondSmallVideoList: [SmallVideoModel] = []
    
    //MARK:- Variable Part
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- Constraint Part
    
    
    //MARK:- Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgColorSet()
        delegateSet()
        fontSet()
        mainPosterSet()
        pageSet()
        firstSmallVideoSet()
        bigVideoSet()
        secondSmallVideoSet()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollToIndex(index: 3)
        pageCtrl.currentPage = 3
    }
    
    //MARK:- IBAction Part
    /// IBAction 함수 명은 동사 형태로!!
    
    
    //MARK:- default Setting Function Part
    
    func bgColorSet() {
        view.backgroundColor = UIColor.black
        bgView.backgroundColor = UIColor(named: "watcha_bg")
        firstSmallVideoCollectionView.backgroundColor = UIColor(named: "watcha_bg")
        bigVideoCollectionView.backgroundColor = UIColor(named: "watcha_bg")
        secondSmallVideoCollectionView.backgroundColor = UIColor(named: "watcha_bg")
    }
    
    func delegateSet() {
        mainPosterCollectionView.delegate = self
        mainPosterCollectionView.dataSource = self
        mainPosterCollectionView.contentInsetAdjustmentBehavior = .never
        firstSmallVideoCollectionView.delegate = self
        firstSmallVideoCollectionView.dataSource = self
        mainScrollView.delegate = self
        bigVideoCollectionView.delegate = self
        bigVideoCollectionView.dataSource = self
        secondSmallVideoCollectionView.delegate = self
        secondSmallVideoCollectionView.dataSource = self
    }
    
    func pageSet() {
        pageCtrl.numberOfPages = mainPosterList.count
    }
    
    func fontSet() {
        firstSmallVideoLabel.textColor = UIColor.watcha_white
//        firstSmallVideoLabel.font = UIFont.maintitle_medium_rg
        secondSmallVideoLabel.textColor = UIColor.watcha_white
//        secondSmallVideoLabel.font = UIFont.maintitle_medium_rg
    }
    
    func mainPosterSet() {
        mainPosterList.append(contentsOf: [
            PosterModel(imageName: "imgMainBigIos1"),
            PosterModel(imageName: "imgMainBigIos2"),
            PosterModel(imageName: "imgMainBigIos3"),
            PosterModel(imageName: "imgMainBigIos4"),
            PosterModel(imageName: "imgMainBigIos5"),
            PosterModel(imageName: "imgMainBigIos6"),
            PosterModel(imageName: "imgMainBigIos7")
        ])
    }
    
    func firstSmallVideoSet() {
        firstSmallVideoList.append(contentsOf: [
            SmallVideoModel(imageName: "cardSmall1", title: "캐롤"),
            SmallVideoModel(imageName: "cardSmall2", title: "검정고무신"),
            SmallVideoModel(imageName: "cardSmall3", title: "시카고")
        ])
    }
    
    func bigVideoSet() {
        bigVideoList.append(contentsOf: [
            BigVideoModel(imageName: "cardMainBigImgPartyIos1", title: "거침없이 무야호", episode: "거침없이 하이킥: 에피소드 157", watchingPerson: "봉준호사랑해", numOfpeople: 27),
            BigVideoModel(imageName: "cardMainBigImgPartyIos2", title: "대만영화", episode: "상견니", watchingPerson: "현경", numOfpeople: 14)
        ])
    }
    
    func secondSmallVideoSet() {
        secondSmallVideoList.append(contentsOf: [
            SmallVideoModel(imageName: "cardSmall4", title: "싱스트리트"),
            SmallVideoModel(imageName: "cardSmall5", title: "드림걸즈"),
            SmallVideoModel(imageName: "cardSmall6", title: "하하네")
        ])
    }
    
    
    //MARK:- Function Part
    
    func scrollToIndex(index: Int) {
        let indexPath = NSIndexPath(item: index, section: 0)
        mainPosterCollectionView.scrollToItem(at: indexPath as IndexPath, at: .right, animated: false)
    }
    
}
//MARK:- extension 부분

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == mainPosterCollectionView {
            return mainPosterList.count
        }
        else if collectionView == firstSmallVideoCollectionView {
            return firstSmallVideoList.count
        } else if collectionView == bigVideoCollectionView {
            return bigVideoList.count
        } else {
            return secondSmallVideoList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == mainPosterCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainPosterCollectionViewCell", for: indexPath) as? MainPosterCollectionViewCell  else { return UICollectionViewCell() }
            cell.posterImageView.image = mainPosterList[indexPath.row].image
            return cell
        }
        else if collectionView == firstSmallVideoCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSmallVideoCollectionViewCell", for: indexPath) as? FirstSmallVideoCollectionViewCell  else { return UICollectionViewCell() }
            cell.img.image = firstSmallVideoList[indexPath.row].image
            cell.title.text = firstSmallVideoList[indexPath.row].title
            return cell
        } else if collectionView == bigVideoCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigVideoCollectionViewCell", for: indexPath) as? BigVideoCollectionViewCell  else { return UICollectionViewCell() }
            cell.img.image = bigVideoList[indexPath.row].image
            cell.title.text = bigVideoList[indexPath.row].title
            cell.episode.text = bigVideoList[indexPath.row].episode
            cell.watchingUser.text = bigVideoList[indexPath.row].watchingStatus
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSmallVideoCollectionViewCell", for: indexPath) as? SecondSmallVideoCollectionViewCell  else { return UICollectionViewCell() }
            cell.img.image = secondSmallVideoList[indexPath.row].image
            cell.title.text = secondSmallVideoList[indexPath.row].title
            return cell
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView != self.mainPosterCollectionView { return }
        pageCtrl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == mainPosterCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == mainPosterCollectionView {
            return 0
        } else if collectionView == firstSmallVideoCollectionView{
            return 4
        } else {
            return -12
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.mainScrollView {
            let offset = scrollView.contentOffset.y
            let percentage = offset/200
            mainTopView.alpha = percentage
        }
    }
}
