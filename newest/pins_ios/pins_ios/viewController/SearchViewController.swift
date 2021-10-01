//
//  SearchViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/03.
//

import UIKit
import MapKit

class SearchViewController: UIViewController, UITextFieldDelegate{
    // MARK: - IB Something
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!{didSet { searchBar.delegate = self }}
    @IBOutlet weak var keyWordText: UIButton!
    @IBOutlet weak var tagImage: UIImageView!
    
    
    // MARK: - Button Event
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
    
    // MARK: - Private
    // MARK: - 지역 검색 변수들
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
        if viewModel.getCountPlaces() > 0 {
            return viewModel.getCountPlaces()
        }
        else if viewModel.getAllDatas().count > 0  && searchText == ""{
            return viewModel.getAllDatas().count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        if let place = viewModel.getPlacesIndex(index: indexPath.row) {
            
            cell.titleLabel.text = place.placeName
            let distance = CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!).distance(from: CLLocationCoordinate2D(latitude: myPosition.coordinate.latitude, longitude: myPosition.coordinate.longitude)) / 1000
            cell.distance.setTitle( String(format: "%.01fkm", distance), for: .normal)
            cell.distance.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            cell.distance.isEnabled = false
            
            cell.titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.iconImage.image = #imageLiteral(resourceName: "iconPIn")
            cell.type = 0
        }
        else if searchText == ""{
            tableView.snp.updateConstraints { view in
                view.top.equalTo(self.view).offset(80)
            }
            
            let datas = viewModel.getAllDatas()
            cell.titleLabel.text = datas[indexPath.row].term
            cell.titleLabel.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
            
            cell.distance.setTitle("X", for: .normal)
            cell.distance.setTitleColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), for: .normal)
            cell.distance.tag = indexPath.row
            cell.distance.addTarget(self, action: #selector(deletedata), for: .touchUpInside)

            if datas[indexPath.row].type == 0 {
                cell.iconImage.image = #imageLiteral(resourceName: "pinLight")
                cell.type = 1
            }
            else{
                cell.iconImage.image = #imageLiteral(resourceName: "iconFeatherTagLight")
                cell.type = 2
            }
        }
        return cell
    }
}



extension SearchViewController: UITableViewDelegate {
    // 선택된 위치의 정보 가져오기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 만약에 item term이랑 같은 테이블이 있다면 안넣음.
        let seleted = tableView.cellForRow(at: indexPath) as! Cell
        
        if seleted.type == 0{
            tableView.deselectRow(at: indexPath, animated: true) // 선택 표시 해제
            // dismiss 하고 해당 위치로 이동
            latitude = (viewModel.getPlacesIndex(index: indexPath.row)?.latitude)!
            longitude = (viewModel.getPlacesIndex(index: indexPath.row)?.longitude)!
            
            let preVC = self.navigationController?.viewControllers[0] as! ViewController
            preVC.paramLongitude = longitude
            preVC.paramLatitude = latitude
            preVC.paramSearchText = ""
            preVC.paramType = 1
            self.navigationController?.popViewController(animated: true)
            
            removeDuplicate(indexPath: indexPath, latitude: latitude, longitude: longitude)
        }
        else{
            tableView.deselectRow(at: indexPath, animated: true) // 선택 표시 해제
            // dismiss 하고 해당 위치로 이동
            latitude = viewModel.getIndexData(index: indexPath.row).latitude
            longitude = viewModel.getIndexData(index: indexPath.row).longitude
            searchText = viewModel.getIndexData(index: indexPath.row).term!
            searchText.removeFirst()
            searchText.removeLast()
            if seleted.type == 1{
                let preVC = self.navigationController?.viewControllers[0] as! ViewController
                preVC.paramLongitude = longitude
                preVC.paramLatitude = latitude
                preVC.paramSearchText = ""
                preVC.paramType = 1
                self.navigationController?.popViewController(animated: true)
            }
            else{
                getSearchKeywordPins()
            }
        }
    }
    
    // 검색 키보드 내리기
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
