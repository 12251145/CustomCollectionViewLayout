//
//  MessageView.swift
//  CustomLayoutCollectionView
//
//  Created by Hoen on 2022/12/05.
//

import UIKit
import SnapKit

final class MessageView: UIView {
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 18)
        label.backgroundColor = .secondarySystemBackground
        label.layer.cornerCurve = .continuous
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with message: Message) {
        messageLabel.text = message.text
    }
    
    private func layout() {
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(5)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.bottom.equalTo(self.snp.bottom).offset(-5)
            $0.width.lessThanOrEqualTo(200)
        }
    }
}
