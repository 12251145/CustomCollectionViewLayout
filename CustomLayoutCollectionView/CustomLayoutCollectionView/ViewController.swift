//
//  ViewController.swift
//  CustomLayoutCollectionView
//
//  Created by Hoen on 2022/12/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let dataSource = CustomDataSource()
    
    private lazy var messageList: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = dataSource
        
        MessageCell.register(with: collectionView)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        dataSource.append(
            [
                Message(text: "Lorem Ipsum"),
                Message(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"),
                Message(text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."),
                Message(text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
                Message(text: "Lorem Ipsum"),
                Message(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"),
                Message(text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."),
                Message(text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
                Message(text: "Lorem Ipsum"),
                Message(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"),
                Message(text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."),
                Message(text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
            ]
        )
        messageList.reloadData()
    }

    private func layout() {
        messageList.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
}

