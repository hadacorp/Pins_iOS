//
//  SearchViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/03.
//

import UIKit
import MapKit

class SearchViewController: UIViewController, UITextFieldDelegate{
    // MARK:- IB Something
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!{didSet { searchBar.delegate = self }}
    @IBOutlet weak var keyWordText: UIButton!
    @IBOutlet weak var tagImage: UIImageView!
    
    
    // MARK:- Button Event
    @IBAction func getKeywordPins(_ sender: Any) {
        self.getSearchKeywordPins()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK:- Public
    public var viewModel = SearchViewModel(parent: nil, layout: nil)
    public var myPosition: CLLocation!
    public var searchTimer: Timer?
    public var searchText = ""
    
    // 화면 중심을 받기
    public var latitude: Double = 0
    public var longitude: Double = 0
    // MARK:- 지역 검색 변수들
    private var searchCompleter = MKLocalSearchCompleter()
    
    // MARK:- Function
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel(parent: self.view, layout: self.view.safeAreaLayoutGuide)
        
        // 버튼 이벤트 세팅
        setButtonEvent()
        // UI 세팅
        setUI()
        self.searchBar.showsCancelButton = false
        self.searchCompleter.resultTypes = .pointOfInterest
        self.searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.rowHeight = 40
        
        saveData(1, term: "저장 가보자가보자~")
        getAllDatas()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut) {
            self.searchBar.becomeFirstResponder()
        }
    }
    
    private func setUI(){
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            textField.font = UIFont(name: "NotoSansKR-Regular", size: 16)
            textField.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            let backgroundView = textField.subviews.first
            if #available(iOS 11.0, *) { // If `searchController` is in `navigationItem`
                backgroundView?.backgroundColor = UIColor.white //Or any transparent color that matches with the `navigationBar color`
                backgroundView?.subviews.forEach({ $0.removeFromSuperview() }) // Fixes an UI bug when searchBar appears or hides when scrolling
            }
            UISearchBar.appearance().setImage(UIImage(), for: .search, state: .normal)
            UISearchBar.appearance().setImage(UIImage(), for: .clear, state: .normal)
        }
        searchBar.layer.borderColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        searchBar.layer.borderWidth = 1
        searchBar.layer.cornerRadius = 16
    }
    
    private func getAllDatas(){
        let datas: [RecentResearchTerm] = CoreDataManager.shared.getUsers()
        let terms: [String] = datas.map({$0.term!})
        let id: [Int16] = datas.map({$0.index})
        print("all terms = \(terms)")
        print("all ids = \(id)")
    }
    
    private func saveData(_ id: Int16, term: String){
        CoreDataManager.shared.saveRecentSearch(term: term, index: id) { (success) in
            print("saved = \(success)")
        }
    }
    
    private func setButtonEvent(){
        viewModel.getCancel().addTarget(self, action: #selector(self.cancelButton), for: .touchUpInside)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        updateSearchResults(text: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCountPlaces()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        if let place = viewModel.getPlacesIndex(index: indexPath.row) {
            cell.titleLabel.text = place.placeName
            let distance = CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!).distance(from: CLLocationCoordinate2D(latitude: myPosition.coordinate.latitude, longitude: myPosition.coordinate.longitude)) / 1000
            cell.distance.text = String(format: "%.01fkm", distance)
        }
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    // 선택된 위치의 정보 가져오기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // 선택 표시 해제
        // dismiss 하고 해당 위치로 이동
        latitude = (viewModel.getPlacesIndex(index: indexPath.row)?.latitude)!
        longitude = (viewModel.getPlacesIndex(index: indexPath.row)?.longitude)!
        
        let preVC = self.navigationController?.viewControllers[0] as! ViewController
        preVC.paramLongitude = longitude
        preVC.paramLatitude = latitude
        preVC.paramSearchText = nil
        preVC.paramType = 1
        self.navigationController?.popViewController(animated: true)
    }
    
    // 검색 키보드 내리기
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
