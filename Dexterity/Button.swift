//
//  Button.swift
//  Dexterity
//
//  Created by Iavor Dekov on 11/7/16.
//  Copyright © 2016 Iavor Dekov. All rights reserved.
//

import Foundation
import SpriteKit

class Button: SKSpriteNode {
    
    weak var delegate: ButtonDelegate?
    
    var number: Int = 0
    var unlocked = false {
        didSet {
            setColor()
        }
    }
    var pressed = false {
        didSet {
            setColor()
        }
    }
    var canBeReleased = false
    
    init(number: Int) {
        super.init(texture: nil, color: UIColor.red, size: CGSize.init(width: CGFloat(80), height: CGFloat(80)))
        self.number = number
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pressed = true
        delegate?.didTouchButton(number: number)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        pressed = false
        delegate?.didReleaseButton(number: number)
    }
    
    func setColor() {
        color = unlocked ? (pressed ? UIColor.purple : UIColor.green) : UIColor.red
    }
}

protocol ButtonDelegate: class {
    func didTouchButton(number withNumber: Int)
    func didReleaseButton(number withNumber: Int)
}
