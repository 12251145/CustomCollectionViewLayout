//
//  MessageCell.swift
//  CustomLayoutCollectionView
//
//  Created by Hoen on 2022/12/05.
//

import UIKit

final class MessageCell: UICollectionViewCell {
    
    static let id = String(describing: MessageCell.self)
    
    static func register(with collectionView: UICollectionView) {
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: id)
    }
    
    static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath, with message: Message) -> MessageCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? MessageCell ?? MessageCell()
        
        cell.configure(with: message)
        
        return cell
    }
    
    private lazy var messageView: MessageView = {
        let messageView = MessageView()
        contentView.addSubview(messageView)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        
        return messageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(with message: Message) {
        messageView.configure(with: message)
    }
    
    private func layout() {
        messageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
}
