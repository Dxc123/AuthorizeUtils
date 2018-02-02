//
//  ViewController.swift
//  AuthorizeUtils
//
//  Created by Dxc_iOS on 2018/2/2.
//  Copyright © 2018年 代星创. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
/// 判断是否有通讯录、麦克风、 相册、 相机、地理位置等功能访问权限，没有则提示，并自动跳转到设置页
///如果之前被拒绝了，则弹出相关提示框让用户很方便地自动跳转到设置页面去修改权限。
        view.backgroundColor = UIColor.white
//       _ = authorize()
        
      
         AuthorizeUI()//封装
    }
//    func authorize()->Bool{
//        let status = PHPhotoLibrary.authorizationStatus()
//
//        switch status {
//        case .authorized:
//            return true
//
//        case .notDetermined:
//            // 请求授权
//            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
//                DispatchQueue.main.async(execute: { () -> Void in
//                    _ = self.authorize()
//                })
//            })
//
//        default: ()
//        DispatchQueue.main.async(execute: { () -> Void in
//
//
//            self.showAlert(title: "相册访问受限", msg: "点击“确定”，允许访问您的相册", cancel: "取消", okBlock: {
//
//                   AuthorizeUtils.jumpToSystemPrivacySetting()
//            })
//
//
//
//
//
//
//        })
//        }
//        return false
//    }
    
    
    

    
    func AuthorizeUI(){
        AuthorizeUtils.authorizePhotoWith { [weak self] (granted) in
    if granted{
    if let strongSelf = self{
       print("访问相册")
    }
    
    } else{
    self?.showAlert(title: "相册访问受限", msg: "点击“确定”，允许访问您的相册", cancel: "取消", okBlock: {
    
    AuthorizeUtils.jumpToSystemPrivacySetting()
    })
    }
    
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

