//
//  IntroViewController.swift
//  CarouselDemo
//
//  Created by Scott Horsfall on 5/25/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-295, -260, -415, -408, -500, -480]
    var xOffsets : [Float] = [-60, 65, 98, 10, -120, -100]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    // Wanted to use an array to store the image views and set the animations up, was throwing an error
    //var tileImages : [UIImageView] = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // basic function to reuse translations 
    func tileImages(tile: UIImageView, value: CGFloat, txMin: CGFloat, tyMin: CGFloat, scaleMin: CGFloat, rotationMin: CGFloat) {
        
        let tx = convertValue(value, r1Min: -20, r1Max: 588, r2Min: txMin, r2Max: 0)
        let ty = convertValue(value, r1Min: 0, r1Max: 588, r2Min: tyMin, r2Max: 0)
        let scale = convertValue(value, r1Min: -20, r1Max: 588, r2Min: scaleMin, r2Max: 1)
        let rotation = convertValue(value, r1Min: -20, r1Max: 588, r2Min: rotationMin, r2Max: 0)
        
        tile.transform = CGAffineTransformMakeTranslation(tx, ty)
        tile.transform = CGAffineTransformScale(tile.transform, CGFloat(scale), CGFloat(scale))
        tile.transform = CGAffineTransformRotate(tile.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        //print(offset)
        
        tileImages(tile1View, value: offset, txMin: CGFloat(xOffsets[0]), tyMin: CGFloat(yOffsets[0]), scaleMin: CGFloat(scales[0]), rotationMin: CGFloat(rotations[0]))
        tileImages(tile2View, value: offset, txMin: CGFloat(xOffsets[1]), tyMin: CGFloat(yOffsets[1]), scaleMin: CGFloat(scales[1]), rotationMin: CGFloat(rotations[1]))
        tileImages(tile3View, value: offset, txMin: CGFloat(xOffsets[2]), tyMin: CGFloat(yOffsets[2]), scaleMin: CGFloat(scales[2]), rotationMin: CGFloat(rotations[2]))
        tileImages(tile4View, value: offset, txMin: CGFloat(xOffsets[3]), tyMin: CGFloat(yOffsets[3]), scaleMin: CGFloat(scales[3]), rotationMin: CGFloat(rotations[3]))
        tileImages(tile5View, value: offset, txMin: CGFloat(xOffsets[4]), tyMin: CGFloat(yOffsets[4]), scaleMin: CGFloat(scales[4]), rotationMin: CGFloat(rotations[4]))
        tileImages(tile6View, value: offset, txMin: CGFloat(xOffsets[5]), tyMin: CGFloat(yOffsets[5]), scaleMin: CGFloat(scales[5]), rotationMin: CGFloat(rotations[5]))
        
        
    }

}
