//
//  ViewController.swift
//  AdlibSDKSwift3_Sample
//
//  Created by gskang on 2016. 10. 20..
//  Copyright © 2016년 gskang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AdlibManagerDelegate {

    @IBOutlet weak var adView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func viewDidAppear(_ animated: Bool) {
        
        let sharedManager: AdlibManager = AdlibManager.sharedSingletonClass()
        sharedManager.attach(self, with: adView, with: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        let sharedManager: AdlibManager = AdlibManager.sharedSingletonClass()
        sharedManager.detach(self)
    }
    
    //전면광고 요청 버튼처리
    @IBAction func actionButton() {
        
        let sharedManager: AdlibManager = AdlibManager.sharedSingletonClass()
        sharedManager.delegate = self
        sharedManager.loadInterstitialAd(self, with: self)
    }
    
    //애드립 띠배너 Delegate 처리
    func didReceiveAdlibAd(_ from: String!) {
        print("received adlib Ad")
    }
    
    func didFail(toReceiveAdlibAd from: String!) {
        print("didFailed adlib Ad")
    }
    
    //애드립 전면배너 Delegate 처리
    func didReceiveAdlibInterstitialAd(_ from: String!) {
        print("received adlib interstitial Ad")
    }
    
    func didFailToReceiveAllInterstitialAd() {
        print("failed to load adlib interstitial Ad")
    }
    
}

