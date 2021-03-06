//
//  PhotoBrowser+HUD.swift
//  ANT_iOS
//
//  Created by 宇玄丶 on 2017/10/20.
//  Copyright © 2017年 qianmo. All rights reserved.
//

import UIKit

extension PhotoBrowser {
  
    /** 展示 */
    func showHUD(text: String,autoDismiss: Double) {
        
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.hud.alpha = 1
        })
        
        hud.text = text
        self.view.addSubview(hud)
        hud.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.width.equalTo(120)
            make.height.equalTo(44)
        }
        
        if autoDismiss == -1 {
            return
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + autoDismiss) {
            DispatchQueue.main.async {
                self.dismissHUD()
            }
        }
    }
    
    /** 消失 */
    func dismissHUD() {
        
        UIView.animate(withDuration: 0.25, animations: {[unowned self] () -> Void in
            self.hud.alpha = 0
            
        }) { (compelte) -> Void in
            
            self.hud.text = ""
            self.hud.removeFromSuperview()
        }
    }
}

