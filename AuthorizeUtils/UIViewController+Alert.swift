//
//  UIViewController+Alert.swift
// MikewuSwift
//
//  Created by Dxc_iOS on 2017/4/2.
//  Copyright © 2017年 杭州兆云科技有限公司. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    //MARK: -显示 （信息）  确定
    func showAlert(_ title: String = "", msg: String?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
 //MARK: -显示（ 错误信息）  确定
    func showAlert(_ title: String = "", error: Error?) {
        if let error = error, view.window != nil {
            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (_) -> Void in
                
            }))
            present(alert, animated: true, completion: nil)
        }
    }
//MARK: -显示 确定 和取消
    func showAlert(title: String?,
                   msg: String?,
                   cancel: String?, cancelBlock: (() -> Void)? = nil,
                   ok: String = "确定", okBlock: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        if let cancel = cancel {
            alert.addAction(UIAlertAction(title: cancel, style: UIAlertActionStyle.cancel, handler: { (_) in
                cancelBlock?()
            }))
        }
        alert.addAction(UIAlertAction(title: ok, style: UIAlertActionStyle.destructive, handler: { (_) in
            okBlock()
        }))
        present(alert, animated: true, completion: nil)
    }
}
