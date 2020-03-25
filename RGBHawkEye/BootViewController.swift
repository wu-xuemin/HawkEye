//
//  BootViewController.swift
//  RGBHawkEye
//
//  Created by wxm on 2020/3/24.
//  Copyright © 2020 wxm. All rights reserved.
//

import UIKit

class BootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidAppear( _ animated: Bool) {
        super.viewDidAppear(animated)
        
        if WXApi.isWXAppInstalled() {
            print("weixin ready")
        } else {
            // 把微信登录的按钮隐藏掉
            print("weixin not installed")
        }
        
    }

    // 请求CODE
    @IBAction func wechatLoginClick(sender: UIButton) {
        // 如果在这里判断是否安装了微信，会报－canOpenURL: failed for URL: "weixin://app/wx5efead4057f98bc0/" - error: "This app is not allowed to query for scheme weixin"错误
            let req = SendAuthReq()
            req.scope = "snsapi_userinfo"
            req.state = "App"
        //第三方向微信终端发送一个SendAuthReq消息结构
//            if !WXApi.sendReq(req) {
//                print("weixin sendreq failed")
//    }
        WXApi.send(req)
        
    }

}
