//
//  FavouritesTableViewCell.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 02/05/24.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {
    static let identifier = String(describing: FavouritesTableViewCell.self)
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var profileTextView = UIView()
    private lazy var nameProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "AG"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var contactTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "mobile"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var contactTypeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.lightGray)
        imageView.setHeightConstraint(to: 15)
        imageView.setWidthConstraint(to: 15)
        return imageView
    }()
    
    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "info.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemBlue)
        imageView.setHeightConstraint(to: 30)
        imageView.setWidthConstraint(to: 30)
        return imageView
    }()
    
    private lazy var contactsTypeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var contactsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    //MARK: Lifecycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupTextCircularView()
        setupContactTypeStackView()
        setupContactsStackView()
        setupHorizontalStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup views
    private func setupTextCircularView() {
        profileTextView.setHeightConstraint(to: 30)
        profileTextView.setWidthConstraint(to: 30)
        
        profileTextView.layer.cornerRadius = 15
        profileTextView.backgroundColor = .gray
        
        nameProfileLabel
            .add(to: profileTextView)
            .enableAutoLayout()
            .setCenterX(to: profileTextView)
            .setCenterY(to: profileTextView)
    }
    
    private func setupContactTypeStackView() {
        contactsTypeStackView.addArrangedSubview(contactTypeIcon)
        contactsTypeStackView.addArrangedSubview(contactTypeLabel)
    }
    
    private func setupContactsStackView() {
        contactsStackView.addArrangedSubview(nameLabel)
        contactsStackView.addArrangedSubview(contactsTypeStackView)
    }
    
    private func setupHorizontalStackView() {
        horizontalStackView.addArrangedSubview(profileTextView)
        horizontalStackView.addArrangedSubview(contactsStackView)
        horizontalStackView.addArrangedSubview(infoImageView)
        
        horizontalStackView
            .add(to: contentView)
            .enableAutoLayout()
            .pinAllSides(to: contentView, top: 8, bottom: 8)
    }
    
    func setup(name: String) {
        nameLabel.text = name
        var nameAbbr = ""
        name.split(separator: " ").forEach { substr in
            nameAbbr += String(substr.first ?? Character(""))
        }
        
        nameProfileLabel.text = nameAbbr
    }
}
