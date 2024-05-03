//
//  RecentTableViewCell.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 03/05/24.
//

import UIKit

class RecentTableViewCell: UITableViewCell {
    //MARK: Other variables
    static let identifier = String(describing: RecentTableViewCell.self)
    
    //MARK: View variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var callTypeView = UIView()
    private lazy var outgoingCallImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.arrow.up.right.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.lightGray)
        return imageView
    }()
    
    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "info.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemBlue)
        imageView.setHeightConstraint(to: 30)
        imageView.setWidthConstraint(to: 30)
        return imageView
    }()
    
    private lazy var numberDetailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    
    //MARK: Lifecycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCallTypeView()
        setupNumberDetailsStackView()
        setupHorizontalStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup Views
    func setup(model: RecentCallModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        dayLabel.text = model.day
        
        if model.count > 1 {
            titleLabel.text = model.title + " (\(model.count)) "
        }
        
        if model.callType == .outgoing {
            outgoingCallImageView.isHidden = false
        } else if model.callType == .missed {
            titleLabel.textColor = .systemRed
        }
    }
    
    private func setupCallTypeView() {
        callTypeView
            .setWidthConstraint(to: 30)
            .setHeightConstraint(to: 30)
        
        outgoingCallImageView
            .add(to: callTypeView)
            .enableAutoLayout()
            .setTopAnchor(toTopOf: callTypeView)
            .setCenterX(to: callTypeView)
        
        outgoingCallImageView.isHidden = true
    }
    
    private func setupNumberDetailsStackView() {
        numberDetailsStackView.addArrangedSubview(titleLabel)
        numberDetailsStackView.addArrangedSubview(subtitleLabel)
    }
    
    private func setupHorizontalStackView() {
        horizontalStackView.addArrangedSubview(callTypeView)
        horizontalStackView.addArrangedSubview(numberDetailsStackView)
        horizontalStackView.addArrangedSubview(dayLabel)
        horizontalStackView.addArrangedSubview(infoImageView)
        
        dayLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        numberDetailsStackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        horizontalStackView
            .add(to: contentView)
            .enableAutoLayout()
            .pinAllSides(to: contentView, top: 8, trailing: 16, bottom: 8, leading: 8)
    }
}
