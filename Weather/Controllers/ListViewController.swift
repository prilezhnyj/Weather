//
//  ViewController.swift
//  Weather
//
//  Created by Максим Боталов on 12.06.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Избранные города", "Все города"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let listTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 54
        tableView.separatorInset = .init(top: 0, left: 70, bottom: 0, right: 16)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var arrayCity = [CurrentWeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Список городов"
        
        setupBarButtonItem()
        setupSearchController()
        setupTableView()
        setupConstraints()
        
        let backButton = UIBarButtonItem()
        backButton.title = "К списку"
        navigationItem.backBarButtonItem = backButton
        
//        arrayCity.append(WeatherModel(city: "Пермь", region: "Пермский край", temp: "+20", status: "Небольшой дождь", cityImage: UIImage(named: "perm"), descriptionImage: UIImage(systemName: "cloud.rain")))
//        arrayCity.append(WeatherModel(city: "Кудымкар", region: "Пермский край", temp: "+17", status: "Солнечно", cityImage: UIImage(named: "kudymkar"), descriptionImage: UIImage(systemName: "sun.max")))
    }
    
    // MARK: setupBarButtonItem
    fileprivate func setupBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(editListAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingsAppAction))
    }
    
    // MARK: setupSearchController
    fileprivate func setupSearchController() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        
        let placeholder = NSAttributedString(string: "Начните вводить название города", attributes: [.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 15)!])
        searchController.searchBar.searchTextField.attributedPlaceholder = placeholder
        
        
    }
    
    fileprivate func setupTableView() {
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(CityCell.self, forCellReuseIdentifier: CityCell.cellID)
    }
}

// MARK: - UISearchControllerDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.cellID, for: indexPath) as! CityCell
        cell.configureCell(with: arrayCity[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажимаю на ячейку \(indexPath.row)")
    }
}

// MARK: -  @objc methods
extension ListViewController {
    @objc fileprivate func editListAction() {
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
    @objc fileprivate func settingsAppAction() {
        print("Перехожу в настройки приложения")
    }
}

// MARK: - setupConstraints
extension ListViewController {
    fileprivate func setupConstraints() {
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
        
        view.addSubview(listTableView)
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}

