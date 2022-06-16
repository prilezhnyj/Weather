//
//  CityCell.swift
//  Weather
//
//  Created by Максим Боталов on 12.06.2022.
//

import UIKit

class CityCell: UITableViewCell {
    
    static let cellID = "CityCell"
    
    let cityImage = UIImageView(image: nil)
    let descriptionImage = UIImageView(image: nil)
    
    let cityName = UILabel(font: .boldSystemFont(ofSize: 18), textColor: .black, textAlignment: .left)
    let regionName = UILabel(font: .systemFont(ofSize: 14), textColor: .black, textAlignment: .left)
    let currentTemp = UILabel(font: .boldSystemFont(ofSize: 18), textColor: .black, textAlignment: .right)
    let descriptionStates = UILabel(font: .systemFont(ofSize: 14), textColor: .black, textAlignment: .left)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cityImage.layer.cornerRadius = 38/2
        cityImage.clipsToBounds = true
        
        descriptionImage.layer.cornerRadius = 17/2
        descriptionImage.clipsToBounds = true
    }
    
    func configureCell(with model: CurrentWeatherData) {
//        cityName.text = model.name
//        regionName.text = model.region
//        currentTemp.text = model.temp + "°C"
//        descriptionStates.text = model.status
//        cityImage.image = model.cityImage
//        descriptionImage.image = model.descriptionImage
        
    }
}

extension CityCell {
    fileprivate func setupConstraints() {
        self.addSubview(cityImage)
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            cityImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cityImage.heightAnchor.constraint(equalToConstant: 38),
            cityImage.widthAnchor.constraint(equalToConstant: 38)])
        
        self.addSubview(cityName)
        NSLayoutConstraint.activate([
            cityName.topAnchor.constraint(equalTo: cityImage.topAnchor),
            cityName.leadingAnchor.constraint(equalTo: cityImage.trailingAnchor, constant: 16)])
        
        self.addSubview(regionName)
        NSLayoutConstraint.activate([
            regionName.topAnchor.constraint(equalTo: cityName.bottomAnchor),
            regionName.leadingAnchor.constraint(equalTo: cityName.leadingAnchor)])
        
        self.addSubview(currentTemp)
        NSLayoutConstraint.activate([
            currentTemp.topAnchor.constraint(equalTo: cityName.topAnchor),
            currentTemp.leadingAnchor.constraint(equalTo: cityName.trailingAnchor),
            currentTemp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)])
        self.addSubview(descriptionStates)
        NSLayoutConstraint.activate([
            descriptionStates.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            descriptionStates.topAnchor.constraint(equalTo: currentTemp.bottomAnchor)])
        
        self.addSubview(descriptionImage)
        NSLayoutConstraint.activate([
            descriptionImage.heightAnchor.constraint(equalToConstant: 17),
            descriptionImage.widthAnchor.constraint(equalToConstant: 17),
            descriptionImage.trailingAnchor.constraint(equalTo: descriptionStates.leadingAnchor, constant: -8),
            descriptionImage.centerYAnchor.constraint(equalTo: descriptionStates.centerYAnchor)])
    }
}
