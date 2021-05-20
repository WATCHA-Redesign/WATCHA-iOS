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
        
        mainTableView.register(SmallPosterTVC.Nib, forCellReuseIdentifier: SmallPosterTVC.identifier)
        mainTableView.register(RecommandTVC.Nib, forCellReuseIdentifier: RecommandTVC.identifier)
        mainTableView.register(CrewPickTVC.Nib, forCellReuseIdentifier: CrewPickTVC.identifier)
        mainTableView.register(DirectorTVC.Nib, forCellReuseIdentifier: DirectorTVC.identifier)
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        //이게 맞을까 ..? ...
        
        case 0:
            return 180.0 - 51.0
        case 1:
            return 350.0 - 51.0
        case 2:
            return 100.0 // 이거 내맘임 ㄷ ㄷ
        case 3:
            return 180.0
        default:
            return 100.0
        }
    }
    
}

//https://hyerios.tistory.com/61 - tableview cell 생성

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //이것도 맞을까 ....?
        switch indexPath.section {
        case 0:
            
            let cell: SmallPosterTVC = mainTableView.dequeueReusableCell(for: indexPath)
            return cell
            
        case 1:
            
            let cell: RecommandTVC = mainTableView.dequeueReusableCell(for: indexPath)
            return cell
            
        case 2:
            
            let cell: CrewPickTVC = mainTableView.dequeueReusableCell(for: indexPath)
            return cell
            
        case 3:
            
            let cell: DirectorTVC = mainTableView.dequeueReusableCell(for: indexPath)
            cell.backgroundColor = .watcha_bg
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
}


