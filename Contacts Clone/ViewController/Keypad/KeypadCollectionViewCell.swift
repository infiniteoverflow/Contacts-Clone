//
//  KeypadCollectionViewCell.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 29/04/24.
//

import UIKit

class KeypadCollectionViewCell: UICollectionViewCell {
    //MARK: Other variables
    static let identifier = String(describing: KeypadCollectionViewCell.self)
    private var isCallButton: Bool?
    
    //MARK: View variables
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private lazy var textsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.fill")?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(.white)
        return imageView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    //MARK: Lifecycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup views
    private func setupViews() {
        numberLabel
            .add(to: contentView)
            .enableAutoLayout()
            .setCenterX(to: contentView)
       
        if textsLabel.text != "" && numberLabel.text != "*" {
            numberLabel.setCenterY(to: contentView, constant: -8)
            textsLabel.addCharactersSpacing(spacing: 1.2)
            textsLabel
                .add(to: contentView)
                .enableAutoLayout()
                .setTopAnchor(toBottomOf: numberLabel)
                .setCenterX(to: contentView)
        } else {
            numberLabel.font = .systemFont(ofSize: 36)
            numberLabel.setCenterY(to: contentView, constant: 0)
        }
    }
    
    private func setupDialImageView() {
        phoneImageView
            .add(to: contentView)
            .enableAutoLayout()
            .setHeightConstraint(to: 30)
            .setWidthConstraint(to: 30)
            .setCenterX(to: contentView)
            .setCenterY(to: contentView)
    }
    
    private func setupContentView() {
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 40
    }
    
    func setup(number: String, text: String, isCallButton: Bool = false) {
        self.isCallButton = isCallButton
        numberLabel.text = number
        textsLabel.text = text
        
        if text == "+" {
            textsLabel.font = .systemFont(ofSize: 16)
        }
        
        if isCallButton == true {
            contentView.backgroundColor = .systemGreen
            setupDialImageView()
        } else {
            setupViews()
        }
    }
}
