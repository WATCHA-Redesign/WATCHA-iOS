//
//  SearchViewController.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    //MARK:- IBOutlet

    @IBOutlet var mainTableView: UITableView!
    @IBOutlet weak var searchPlaceholder: UITextField!
    
    
    //MARK:- Variable
    
    var titles: [SearchTitleModel] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- Constraint
    
    
    
    //MARK:- Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        tableViewSetting()
        setTitleData()

    }
    
    //MARK:- IBAction

    
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    
    func tableViewSetting() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        mainTableView.backgroundColor = .watcha_bg
        mainTableView.sectionHeaderHeight = CGFloat(51.0)
    }
    
    
    func setTitleData() {
        titles.append(contentsOf: [
            
            SearchTitleModel(title: "인기 검색 콘텐츠"),
            SearchTitleModel(title: "높은 평점의 추천 콘텐츠"),
            SearchTitleModel(title: "왓챠 크루들의 컬렉션"),
            SearchTitleModel(title: "당신의 영화 메이트")
        
        ])
    }
    
    
    //MARK:- Function
    /// 로직을 구현 하는 함수 부분입니다. // 함수명 lowerCamelCase 사용
    
    
}

    //MARK:- extension

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                "sectionHeader") as! MyCustomHeader
        
        view.tintColor = .watcha_bg
        view.titleLabel.textColor = .watcha_white
        view.titleLabel.text = titles[section].title
        
        return view
    }
    
    
    
}

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //임시 테이블 뷰 띄우기
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "SmallPosterTVC") as? SmallPosterTVC else { return UITableViewCell() }
        cell.backgroundColor = .watcha_bg

        return cell
    }
    
    
}



        
    
    
    
    
