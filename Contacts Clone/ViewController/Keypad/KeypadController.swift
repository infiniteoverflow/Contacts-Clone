//
//  KeypadController.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 29/04/24.
//

import UIKit

class KeypadController: UIViewController {
    //MARK: Other variables
    private let texts = [
        "+",
        " ",
        "ABC",
        "DEF",
        "GHI",
        "JKL",
        "MNO",
        "PQRS",
        "TUV",
        "WXYZ"
    ]
    
    //MARK: UI View variales
    private lazy var inputFieldView = UIView()
    private lazy var keypadCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: View lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        setupInputField()
        setupKeypadCollectionView()
    }
    
    //MARK: Setup views
    private func registerCells() {
        keypadCollectionView.register(KeypadCollectionViewCell.self, forCellWithReuseIdentifier: KeypadCollectionViewCell.identifier)
    }
    
    private func setupInputField() {
        inputFieldView
            .add(to: view)
            .enableAutoLayout()
            .setLeadingAnchor(toLeadingOf: view)
            .setTopAnchor(toTopOf: view)
            .setTrailingAnchor(toTrailingOf: view)
            .setHeightConstraint(to: view.frame.height * 0.3)
    }
    
    private func setupKeypadCollectionView() {
        keypadCollectionView
            .add(to: view)
            .enableAutoLayout()
            .setTopAnchor(toBottomOf: inputFieldView, constant: 32)
            .setLeadingAnchor(toLeadingOf: view, constant: 64)
            .setTrailingAnchor(toTrailingOf: view, constant: 64)
            .setBottomAnchor(toBottomOf: view)
    }
}

extension KeypadController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeypadCollectionViewCell.identifier, for: indexPath) as? KeypadCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.item == 12 || indexPath.item == 14 {
            cell.isHidden = true
        } else if indexPath.item == 9 {
            cell.setup(number: "*", text: "", isCallButton: false)
        } else if indexPath.item == 11 {
            cell.setup(number: "#", text: "", isCallButton: false)
        } else {
            let index = (indexPath.item + 1) % 11
            cell.setup(number: String(index), text: texts[index], isCallButton: indexPath.item == 13)
        }
        return cell
    }
}

extension KeypadController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 80, height: 80)
    }
}
