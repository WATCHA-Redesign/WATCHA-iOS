//
//  SearchViewController.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    //MARK:- IBOutlet Part

    
    
    //MARK:- Variable Part
    
    @IBOutlet weak var searchPlaceholder: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- Constraint Part
    
    
    //MARK:- Life Cycle Part
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black

    }
    
    //MARK:- IBAction Part
    /// IBAction 함수 명은 동사 형태로!!

    
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    
    //MARK:- Function Part
    /// 로직을 구현 하는 함수 부분입니다. // 함수명 lowerCamelCase 사용
    
    
    
    //MARK:- extension 부분
    /// UICollectionViewDelegate 부분 처럼 외부 프로토콜을 채택하는 경우나, 외부 클래스 확장 할 때,  extension을 작성하는 부분입니다
    /// ex) extension ViewController : UICollectionViewDelegate {  code …. }
    
    
    
    
    
    
}
