//
//  Message.swift
//  CustomLayoutCollectionView
//
//  Created by Hoen on 2022/12/05.
//

import UIKit

struct Message {
    var text: String
    
    var height: CGFloat {
        let textHeight = NSString(string: text).boundingRect(
            with: CGSize(width: 200, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 18)],
            context: nil
        ).height
        
        let topBottomOffset: CGFloat = 10
        
        return textHeight + topBottomOffset
    }
}
