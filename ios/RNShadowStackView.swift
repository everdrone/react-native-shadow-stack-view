//
//  RNShadowStackView.swift
//  shadowstack
//
//  Created by Giorgio on 29/10/2018.
//

import Foundation
import UIKit

class ShadowStackView : UIView {
    
    let shadowContainerView = UIView()
    let containerView = UIView()
    
    // style props
    var bckColor : UIColor = .clear
    
    struct Shadow {
        var opacity : Float
        var color : CGColor
        var offset : CGSize
        var radius : CGFloat
    }
    
    var sss : [AnyHashable: Any] = [:]
    
    var shadows : [Shadow] = [
        Shadow(opacity: 0.2, color: UIColor.red.cgColor, offset: CGSize(width: 0, height: 5), radius: 10)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(shadowContainerView)
        addSubview(containerView)
        // insert shadows
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // super.draw(rect)
        
        containerView.frame = rect
        containerView.backgroundColor = bckColor
        
        shadowContainerView.frame = rect
        shadows.forEach { s in
            let nv = UIView(frame: rect)
            nv.layer.shadowPath = UIBezierPath(rect: rect).cgPath
            nv.layer.shadowColor = s.color
            nv.layer.shadowOffset = s.offset
            nv.layer.shadowRadius = s.radius
            nv.layer.shadowOpacity = s.opacity
            shadowContainerView.addSubview(nv)
        }
    }
    
    override func didAddSubview(_ subview: UIView) {
        if (subview != containerView) && (subview != shadowContainerView) && (!subview.isDescendant(of: shadowContainerView)) {
            let newSubview = subview
            subview.removeFromSuperview()
            containerView.addSubview(newSubview)
        }
    }
    
    @objc public func setShadows(_ shadows : NSDictionary) {
        self.sss = RCTConvert.nsDictionary(shadows)
        var ss = RCTConvert.nsArray(sss["ss"])
        var stack : [Shadow] = []
        ss?.forEach { s in
            var dict = RCTConvert.nsDictionary(s)
            var size = RCTConvert.cgSize(dict?["offset"])
            stack.append(Shadow(
                opacity: dict?["opacity"] as! Float,
                color: RCTConvert.cgColor(dict?["color"]),
                offset: size,
                radius: dict?["radius"] as! CGFloat
            ))
        }
        self.shadows = stack
    }
    
    @objc public func setBckColor(_ color : NSNumber) {
        self.bckColor = RCTConvert.uiColor(color)
    }
}

@objc(ShadowStackViewManager)
class ShadowStackViewManager: RCTViewManager {
    override func view() -> UIView! {
        let ssv = ShadowStackView()
        return ssv
    }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
