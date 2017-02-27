//
//  AdViewController.swift
//  AdlibSDKSwift3_Sample
//
//  Created by gskang on 2017. 2. 27..
//  Copyright © 2017년 gskang. All rights reserved.
//

import UIKit


class AdViewController: UIViewController, ALAdBannerViewDelegate, ALInterstitialAdDelegate {
    
    @IBOutlet weak var adView: ALAdBannerView?
    
    var interstitialAd: ALInterstitialAd?
    
    
    //애드립 키 설정
    let adlibKey: String = "5508e1c70cf2833915d7268a"
    
    //애드몹 키 설정 !!실제 발급받은 아이디를 직접 입력합니다.
    let admobBandAdId: String = "ca-app-pub-XXXX/XXXXXXXX"
    let admobInterstitialAdId: String = "ca-app-pub-XXXX/XXXXXXXX"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        //사용할 미디에이션 플랫폼 클래스를 등록합니다.
        ALMediation.register(ALMEDIATION_PLATFORM.ADMOB, with: ALAdapterAdmob.classForCoder())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        //사용할 미디에이션 플랫폼 띠배너 키를 등록합니다.
        adView?.setKey(admobBandAdId, for: ALMEDIATION_PLATFORM.ADMOB)
        
        //애드립 광고 테스트모드 여부를 설정합니다
        adView?.isTestMode = true
        
        //애드립 미디에이션 반복 호출여부를 설정합니다
        adView?.repeatLoop = true
        
        //애드립 미디에이션 배너뷰에 광고요청 시작을 알립니다
        adView?.startAdView(withKey: adlibKey,
                            rootViewController: self,
                            adDelegate: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        //애드립 미디에이션 배너뷰의 광고 요청을 중지합니다
        adView?.stopAdView()
    }
    
    // 전면광고 요청 버튼처리
    @IBAction func actionButton() {
        
        if interstitialAd != nil {
            interstitialAd?.stopReqeust()
        }
        
        self.interstitialAd = ALInterstitialAd(rootViewController: self)
        
        //사용할 미디에이션 플랫폼 전면배너 키를 등록합니다.
        interstitialAd?.setKey(admobInterstitialAdId, for: ALMEDIATION_PLATFORM.ADMOB)
        
        interstitialAd?.isTestMode = false
        interstitialAd?.request(withKey: adlibKey, adDelegate: self)
    }
    
    /*
     * ALAdBannerView 띠배너 델리게이트
     */
    
    // 특정 플랫폼 광고 수신에 성공한 경우
    func alAdBannerView(_ bannerView: ALAdBannerView!, didReceivedAdAt platform: ALMEDIATION_PLATFORM) {
        print("received adlib Ad : \(ALMediationDefine.name(of: platform))")
    }
    
    // 특정 플랫폼 광고 수신에 실패한 경우
    func alAdBannerView(_ bannerView: ALAdBannerView!, didFailedAdAt platform: ALMEDIATION_PLATFORM) {
        print("didFailed Ad at platform : \(ALMediationDefine.name(of: platform))")
    }
    
    // 스케쥴에 등록된 모든 플랫폼 광고 수신에 실패한 경우
    func alAdBannerViewDidFailed(atAllPlatform bannerView: ALAdBannerView!) -> Bool {
        
        print("didFailed adlib Ad")
        return true
    }
    
    // bannerView의 상태가 변경된 경우 알림, 로그성으로 사용
    func alAdBannerView(_ bannerView: ALAdBannerView!, didChange state: ALMEDIATION_STATE, withExtraInfo info: Any!) {
        print("ALAdBannerView state : \(ALMediationDefine.description(of: state)), info : \(info)")
    }
    
    
    /*
     * ALInterstitialAdDelegate 전면배너 델리게이트
     */
    
    // 특정 플랫폼 광고 수신에 성공한 경우
    func alInterstitialAd(_ interstitialAd: ALInterstitialAd!, didReceivedAdAt platform: ALMEDIATION_PLATFORM) {
        print("received adlib  IntersAd : \(ALMediationDefine.name(of: platform))")
    }
    
    // 특정 플랫폼 광고 수신에 실패한 경우
    func alInterstitialAd(_ interstitialAd: ALInterstitialAd!, didFailedAdAt platform: ALMEDIATION_PLATFORM) {
        print("didFailed IntersAd at platform : \(ALMediationDefine.name(of: platform))")
    }
    
    // 스케쥴에 등록된 모든 플랫폼 광고 수신에 실패한 경우
    func alInterstitialAdDidFailedAd(_ interstitialAd: ALInterstitialAd!) {
        print("didFailed adlib IntersAd")
    }
    
    // 특정 플랫폼 광고에서 클릭이 발생한 경우
    func alInterstitialAd(_ interstitialAd: ALInterstitialAd!, didClickedAdAt platform: ALMEDIATION_PLATFORM) {
        
        print("didClicked IntersAd at platform : \(ALMediationDefine.name(of: platform))")
    }
}

