//
//  PhotoLibrary.swift
//  Pods-PrivacyHelper_Example
//
//  Created by 张先生 on 2021/8/18.
//

import Foundation
import Photos

extension PrivacyHelper {
    @objc public class func photoLibrary(_ authorized: @escaping () -> Void, unauthorized: @escaping () -> Void) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus {
        case .notDetermined:
            // 用户未做出选择, 开始申请相册权限
            PHPhotoLibrary.requestAuthorization { (status) in
                DispatchQueue.main.async {
                    if status == .authorized {
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
