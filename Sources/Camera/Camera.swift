//
//  Camera.swift
//  Pods-PrivacyHelper_Example
//
//  Created by 张先生 on 2021/8/18.
//

import Foundation
import AVFoundation

extension PrivacyHelper {
    @objc open class func camera(_ authorized: @escaping () -> Void, unauthorized: @escaping () -> Void) {
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authStatus {
        case .notDetermined:
            // 用户未做出选择, 开始申请相机权限
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                DispatchQueue.main.async {
                    if granted {
                        // 授权
                        authorized()
                    } else {
                        // 未授权
                        unauthorized()
                    }
                }
            }
        case .authorized:
            // 已授权
            authorized()
        default:
            // 未授权
            unauthorized()
        }
    }
}
