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
    
    var mainPosterList: [MainBanner] = []
    var firstSmallVideoList: [MainWatching] = []
    var secondSmallVideoList: [MainRecommend] = []
    var bigVideoList: [MainPedia] = []
    
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
        getMainBanner()
        getFirstSmallVideo()
        getSecondSmallVideo()
        getBigVideo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollToIndex(index: 3)
        fontSet()
        
    }
    
    //MARK:- IBAction Part
    /// IBAction 함수 명은 동사 형태로!!
    
    
    //MARK:- default Setting Function Part
    func getMainBanner()
    {
        MainBannerService.shared.getData { (result) in
            switch(result)
            {
            case .success(let bannerObject):
                if let banner = bannerObject as? MainBannerDataModel {
                    self.mainPosterList = banner.data.mainBanner
                    self.mainPosterCollectionView.reloadData()
                    self.pageCtrl.numberOfPages = self.mainPosterList.count
                }
            case .requestErr(_):
                return
            case .pathErr:
                return
            case .serverErr:
                return
            case .networkFail:
                return
            }
        }
    }
    
    func getFirstSmallVideo()
    {
        FirstSmallVideoService.shared.getData { (result) in
            switch(result)
            {
            case .success(let firstVideoObject):
                if let firstVideo = firstVideoObject as? FirstSmallVideoDataModel {
                    self.firstSmallVideoList = firstVideo.data.mainWatching
                    self.firstSmallVideoCollectionView.reloadData()
                }
            case .requestErr(_):
                return
            case .pathErr:
                return
            case .serverErr:
                return
            case .networkFail:
                return
            }
        }
    }
    
    func getSecondSmallVideo()
    {
        SecondSmallVideoService.shared.getData { (result) in
            switch(result)
            {
            case .success(let secondVideoObject):
                if let secondVideo = secondVideoObject as? SecondSmallVideoDataModel {
                    self.secondSmallVideoList = secondVideo.data.mainRecommend
                    self.secondSmallVideoCollectionView.reloadData()
                }
            case .requestErr(_):
                return
            case .pathErr:
                return
            case .serverErr:
                return
            case .networkFail:
                return
            }
        }
    }
    
    func getBigVideo()
    {
        BigVideoService.shared.getData { (result) in
            switch(result)
            {
            case .success(let bigVideoObject):
                if let bigVideo = bigVideoObject as? BigVideoDataModel {
                    self.bigVideoList = bigVideo.data.mainPedia
                    self.bigVideoCollectionView.reloadData()
                }
            case .requestErr(_):
                return
            case .pathErr:
                return
            case .serverErr:
                return
            case .networkFail:
                return
            }
        }
    }
    
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

    func fontSet() {
        firstSmallVideoLabel.textColor = UIColor.watcha_white
        secondSmallVideoLabel.textColor = UIColor.watcha_white
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
            let url = URL(string: mainPosterList[indexPath.row].image)
            let data = try? Data(contentsOf: url!)
            cell.posterImageView.image = UIImage(data: data!)
            cell.posterLargeTitle.text = mainPosterList[indexPath.row].largeTitle
            cell.posterDescription.text = mainPosterList[indexPath.row].mainBannerDescription
            return cell
        }
        else if collectionView == firstSmallVideoCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSmallVideoCollectionViewCell", for: indexPath) as? FirstSmallVideoCollectionViewCell  else { return UICollectionViewCell() }
            let url = URL(string: firstSmallVideoList[indexPath.row].image)
            let data = try? Data(contentsOf: url!)
            cell.img.image = UIImage(data: data!)
            cell.title.text = firstSmallVideoList[indexPath.row].title
            return cell
        } else if collectionView == bigVideoCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigVideoCollectionViewCell", for: indexPath) as? BigVideoCollectionViewCell  else { return UICollectionViewCell() }
            let url = URL(string: bigVideoList[indexPath.row].image)
            let data = try? Data(contentsOf: url!)
            cell.img.image = UIImage(data: data!)
            cell.title.text = bigVideoList[indexPath.row].title
            cell.episode.text = bigVideoList[indexPath.row].titleDetail
            cell.watchingUser.text = "\(bigVideoList[indexPath.row].nickname)님 외 \(bigVideoList[indexPath.row].watchingNum)명 시청 중"
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSmallVideoCollectionViewCell", for: indexPath) as? SecondSmallVideoCollectionViewCell  else { return UICollectionViewCell() }
            let url = URL(string: secondSmallVideoList[indexPath.row].image)
            let data = try? Data(contentsOf: url!)
            cell.img.image = UIImage(data: data!)
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

        if collectionView == bigVideoCollectionView {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == mainPosterCollectionView {
            return 0
        } else if collectionView == firstSmallVideoCollectionView{
            return -12
        } else {
            return -20
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
