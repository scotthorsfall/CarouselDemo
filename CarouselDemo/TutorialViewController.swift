//
//  TutorialViewController.swift
//  CarouselDemo
//
//  Created by Scott Horsfall on 5/25/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupImage: UIImageView!
    @IBOutlet weak var backupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        
        backupImage.alpha = 0
        backupButton.enabled = false
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // update dots
        pageControl.currentPage = page
        
        if page == 3 {
            // TODO: ANIMATE IN
            backupButton.enabled = true
            UIView.animateWithDuration(0.3) {
                self.backupImage.alpha = 1
                self.pageControl.hidden = true
            }

        } else {
            pageControl.hidden = false
            backupButton.enabled = false
            self.backupImage.alpha = 0
        }
    }


}
