//
//  SearchViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/03.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {
    // MARK:- IB Something
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var keyWordText: UIButton!
    @IBOutlet weak var tagImage: UIImageView!
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    // MARK:- Public
    public var viewModel = SearchViewModel(parent: nil, layout: nil)
    
    public var cells: [String] = []
    public var coordinates: [CLLocationCoordinate2D] = []
    public var myPosition: CLLocation!
    // MARK:- 지역 검색 변수들
    private let searchTableCellIdentifier = "Cell"
    private var searchCompleter = MKLocalSearchCompleter()
    private var searchRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5342523, longitude: 126.6603896), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    // MARK:- Function
    override func viewDidLoad() {
        super.viewDidLoad()
        // 라이트 모드로 고정
        self.overrideUserInterfaceStyle = .light
        searchBar.becomeFirstResponder()
        
        viewModel = SearchViewModel(parent: self.view, layout: self.view.safeAreaLayoutGuide)
        
        // 버튼 이벤트 세팅
        setButtonEvent()
        // UI 세팅
        setUI()
        // 뒤로가기 제스쳐
        swipeRecognizer()
        
        self.searchBar.showsCancelButton = false
        self.searchBar.becomeFirstResponder()
        //        self.searchCompleter.delegate = self
        self.searchCompleter.resultTypes = .pointOfInterest
        self.searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.rowHeight = 40
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
    
    // 뒤로가기 제스쳐
    private func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    private func setButtonEvent(){
        viewModel.getCancel().addTarget(self, action: #selector(self.cancelButton), for: .touchUpInside)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            // 키워드 텍스트 변경
            keyWordText.layer.opacity = 0
            tagImage.layer.opacity = 0
            cells.removeAll()
            coordinates.removeAll()
            tableView.reloadData()
            print("안깜빡")
        }
        else{
            cells.removeAll()
            coordinates.removeAll()
            tableView.reloadData()
            // 사용자가 search bar 에 입력한 text를 자동완성 대상에 넣는다
            searchCompleter.queryFragment = searchText
            // 입력된 값이 있으면 키워드 텍스트 변경
            keyWordText.layer.opacity = 1
            //            keyWordText.titleLabel!.text = "'\(searchText)'를 키워드로 검색"
            keyWordText.setTitle("'\(searchText)'를 키워드로 검색", for: .normal)
            tagImage.layer.opacity = 1
            
            search(string: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
}

//extension SearchViewController: MKLocalSearchCompleterDelegate {
//    // 자동완성 완료시 결과를 받는 method
//    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
//        searchResults = completer.results
//        tableView.reloadData()
//    }
//    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
//        print(error)
//    }
//}

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell else{ return UITableViewCell()}
        cell.titleLabel.text = cells[indexPath.row]
        let distance = coordinates[indexPath.row].distance(from: CLLocationCoordinate2D(latitude: myPosition.coordinate.latitude, longitude: myPosition.coordinate.longitude)) / 1000
        cell.distance.text = String(format: "%.01fkm", distance)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    private func search(string: String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = string
        
        // Set the region to an associated map view's region.
        searchRequest.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: myPosition.coordinate.latitude, longitude: myPosition.coordinate.longitude), latitudinalMeters: 100, longitudinalMeters: 100)
        searchRequest.resultTypes = .pointOfInterest
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                // Handle the error.
                return
            }
            for item in response.mapItems {
                if let name = item.name, let location = item.placemark.location {
                    self.cells.append(name)
                    self.coordinates.insert(CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), at: self.cells.count - 1)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // 선택된 위치의 정보 가져오기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // 선택 표시 해제
        // dismiss 하고 해당 위치로 이동
        let latitude = self.coordinates[indexPath.row].latitude
        let longitude = self.coordinates[indexPath.row].longitude
        
        let preVC = self.presentingViewController
    
        guard let vc = preVC as? ViewController else {
            return
        }

        // 값을 전달한다.
        vc.paramLatitude = latitude
        vc.paramLongitude = longitude
        // 이전 화면으로 복귀한다.
        self.presentingViewController?.dismiss(animated: true)
    }
}

