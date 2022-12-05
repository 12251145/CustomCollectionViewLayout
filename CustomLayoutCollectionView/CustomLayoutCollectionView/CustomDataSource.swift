//
//  CustomDataSource.swift
//  CustomLayoutCollectionView
//
//  Created by Hoen on 2022/12/05.
//

import UIKit

final class CustomDataSource: NSObject, UICollectionViewDataSource {
    
    // 데이터
    private var messages: [Message] = []
    
    // 데이터가 위치할 offset들
    private(set) var offsets: [CGFloat] = []
    
    // 각 셀이 가질 높이, 데이터로부터 미리 계산
    var heights: [CGFloat] {
        return messages.map { $0.height }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let message = messages[indexPath.item]
        
        return MessageCell.dequeue(from: collectionView, at: indexPath, with: message)
    }
    
    // 데이터 추가, offset들을 계산해준다.
    func append(_ data: [Message]) {
        messages += data
        for message in data {
            offsets.append((offsets.last ?? 0) + message.height)
        }
    }
}
