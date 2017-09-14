//
//  ViewController.swift
//  SomeRequests
//
//  Created by jiangxiaohan on 2017/9/14.
//  Copyright © 2017年 JXH. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        groupSync()
    }
    
    func groupSync() {
        let group = DispatchGroup()
        
        group.enter()
        request1(group: group)
        group.enter()
        request2(group: group)
        group.enter()
        request3(group: group)
        
        group.notify(queue: DispatchQueue.main) {
            print("------------")
            print("------------")
            print("------------")
            print("刷新")
        }
        
    }
    
    func request1(group: DispatchGroup) {
        AFHTTPSessionManager().get("http://www.baidu.com", parameters: nil, progress: nil, success: { (task, result) in
            
            print("success1")
            print(task)
            print(result ?? "request1")
            print("__________________")
            group.leave()
        }, failure: { (task, error) in
            print("error1")
            print(task ?? "request")
            print(error)
            print("__________________")
            group.leave()
        })
    }
    
    func request2(group: DispatchGroup) {
        AFHTTPSessionManager().get("http://www.baidu.com", parameters: nil, progress: nil, success: { (task, result) in
            
            print("success2")
            print(task)
            print(result ?? "request2")
            print("__________________")
            group.leave()
        }, failure: { (task, error) in
            print("error2")
            print(task ?? "request2")
            print(error)
            print("__________________")
            group.leave()
        })
    }

    func request3(group: DispatchGroup) {
        AFHTTPSessionManager().get("http://www.baidu.com", parameters: nil, progress: nil, success: { (task, result) in
            
            print("success3")
            print(task)
            print(result ?? "request3")
            print("__________________")
            group.leave()
        }, failure: { (task, error) in
            print("error3")
            print(task ?? "request3")
            print(error)
            print("__________________")
            group.leave()
        })
    }
}

