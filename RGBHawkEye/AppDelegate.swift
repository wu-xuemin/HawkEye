//
//  AppDelegate.swift
//  RGBHawkEye
//
//  Created by wxm on 2020/3/16.
//  Copyright © 2020 wxm. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,WXApiDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

//        window?.Boot
        //向微信注册应用
          // @param1 微信开发者ID
          // @param2 应用附加信息，长度不超过1024字节
//          WXApi.registerApp("wx930d6e916143e08c", withDescription: "wechat")
          WXApi.registerApp("wx930d6e916143e08c", universalLink: "wechat")
        
        return true
    }
    
     
       // 这个方法是用于从微信返回第三方App 处理微信通过URL启动App时传递的数据
       // @param url 微信启动第三方应用时传递过来的URL
       // @param delegate WXApiDelegate对象，用来接收微信触发的消息。
       func application(application: UIApplication, handleOpenURL url: URL) -> Bool {
           if url.scheme == "wx930d6e916143e08c" {
               WXApi.handleOpen(url, delegate: self)
           }
           return true
       }

       func application(application: UIApplication, openURL url: URL, sourceApplication: String?, annotation: AnyObject) -> Bool {
           if url.scheme == "wx930d6e916143e08c" {
               WXApi.handleOpen(url, delegate: self)
           }
           return true
       }

//       func application(app: UIApplication, openURL url: URL, options: [String : AnyObject]) -> Bool {
//           Tools.logPrint("openURL:\(url.absoluteString)")
//           if url.scheme == "wxed8b3e67969559b5" {
//               return WXApi.handleOpen(url, delegate: self)
//           }
//           return true
//       }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "RGBHawkEye")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

