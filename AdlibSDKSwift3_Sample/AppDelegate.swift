//
//  AppDelegate.swift
//  AdlibSDKSwift3_Sample
//
//  Created by gskang on 2016. 10. 20..
//  Copyright © 2016년 gskang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AdlibSessionDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        // 애드립 키로 초기화
        // 실제 사용하실 키로 교체하여 진행하시길 바랍니다.
        // 테스트 키세팅 띠배너 미디에이션 :(애드립, 애드몹, 아담)
        // 테스트 키세팅 전면배너 미디에이션 :(애드립, 애드몹, 아담, 애드립하우스)
        
        let adlibKey: String = "54caefb80cf28de2af4e7001"
        
        let sharedManager: AdlibManager  = AdlibManager.sharedSingletonClass()
        sharedManager.sessionDelegate = self
        
        //사용할 미디에이션 플랫폼 추가
        sharedManager.register(ADLIB_MEDPLATFORM.ADMOB, with: SubAdlibAdViewAdmob.classForCoder())
        
//        sharedManager.register(ADLIB_MEDPLATFORM.ADMIXER, with: SubAdlibAdAdmixer.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.CAULY, with: SubAdlibAdViewCauly.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.INMOBI, with: SubAdlibAdViewInmobi.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.TAD, with: SubAdlibAdViewTAD.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.SHALLWEAD, with: SubAdlibAdViewShallWeAd.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.IAD, with: SubAdlibAdViewiAd.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.ADHUB, with: SubAdlibAdViewAdHub.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.DOMOB, with: SubAdlibAdViewDomob.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.MEDIBAAD, with: SubAdlibAdViewMedibaAd.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.NAVER, with: SubAdlibAdViewNaverAdPost.classForCoder())
//        sharedManager.register(ADLIB_MEDPLATFORM.FACEBOOK, with: SubAdlibAdViewFacebook.classForCoder())
        
        
        //테스트, 사용 모드 설정
        let isTestMode = true
        
        if isTestMode {
            sharedManager.testModeLink(withAdlibKey:adlibKey)
        } else {
            sharedManager.link(withAdlibKey:adlibKey)
        }
        
        return true
    }

    func adlibManager(_ manager: AdlibManager!, didLinkedSessionWithUserInfo userInfo: [AnyHashable : Any]! = [:]) {
        print("adlib linked")
    }
    
    func adlibManager(_ manager: AdlibManager!, didFailedSessionLinkWithError error: Error!) {
        print("adlib link failed")
    }
    
}

