//
//  ViewController.swift
//  ATFluidSegmentedControl
//
//  Created by Array Tag, LLC on 10/05/2023.
//  Copyright (c) 2023 Array Tag, LLC. All rights reserved.
//

import UIKit
import ATFluidSegmentedControl

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet weak var skyScrollView: UIScrollView!
    @IBOutlet weak var segmentedControl: ATFluidSegmentedControl!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 8.2, *) {
            segmentedControl.textFont = .systemFont(ofSize: 16, weight: UIFontWeightSemibold)
        } else {
            segmentedControl.textFont = .boldSystemFont(ofSize: 16)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        segmentedControl(segmentedControl, didScrollWithXOffset: 0)
        
        // Uncomment the following line to set the current segment programmatically.
        // segmentedControl.currentSegment = 1
    }
    
}

// MARK: - ATFluidSegmentedControl Data Source Methods

extension ViewController: ATFluidSegmentedControlDataSource {
    
    func numberOfSegmentsInSegmentedControl(_ segmentedControl: ATFluidSegmentedControl) -> Int {
        return 3
    }
    
    func segmentedControl(_ segmentedControl: ATFluidSegmentedControl,
                          titleForSegmentAtIndex index: Int) -> String? {
        if index == 0 {
            return "Let's".uppercased()
        } else if index == 1 {
            return "See".uppercased()
        }
        return "It".uppercased()
    }
    
    func segmentedControl(_ segmentedControl: ATFluidSegmentedControl,
                          gradientColorsForSelectedSegmentAtIndex index: Int) -> [UIColor] {
        switch index {
        case 0:
            return [UIColor(red: 51 / 255.0, green: 149 / 255.0, blue: 182 / 255.0, alpha: 1.0),
                    UIColor(red: 97 / 255.0, green: 199 / 255.0, blue: 234 / 255.0, alpha: 1.0)]
        case 1:
            return [UIColor(red: 227 / 255.0, green: 206 / 255.0, blue: 160 / 255.0, alpha: 1.0),
                    UIColor(red: 225 / 255.0, green: 195 / 255.0, blue: 128 / 255.0, alpha: 1.0)]
        case 2:
            return [UIColor(red: 21 / 255.0, green: 94 / 255.0, blue: 119 / 255.0, alpha: 1.0),
                    UIColor(red: 9 / 255.0, green: 82 / 255.0, blue: 107 / 255.0, alpha: 1.0)]
        default:
            break
        }
        return [.clear]
    }
    
    func segmentedControl(_ segmentedControl: ATFluidSegmentedControl,
                          gradientColorsForBounce bounce: ATFluidSegmentedControlBounce) -> [UIColor] {
        switch bounce {
        case .left:
            return [UIColor(red: 51 / 255.0, green: 149 / 255.0, blue: 182 / 255.0, alpha: 1.0)]
        case .right:
            return [UIColor(red: 9 / 255.0, green: 82 / 255.0, blue: 107 / 255.0, alpha: 1.0)]
        }
    }

}

// MARK: - ATFluidSegmentedControl Delegate Methods

extension ViewController: ATFluidSegmentedControlDelegate {
    
    func segmentedControl(_ segmentedControl: ATFluidSegmentedControl, didScrollWithXOffset offset: CGFloat) {
        let maxOffset = segmentedControl.frame.width / CGFloat(segmentedControl.segmentsCount * (segmentedControl.segmentsCount - 1))
        var width = view.frame.width * 0.2
        var leftDistance = (backgroundScrollView.contentSize.width - width) * 0.2
        var rightDistance = (backgroundScrollView.contentSize.width - width) * 0.8
        let backgroundScrollViewOffset = leftDistance + ((offset / maxOffset) * (backgroundScrollView.contentSize.width - rightDistance - leftDistance))
        width = view.frame.width
        leftDistance = -width * 0.0001 + 10
        rightDistance = width * 0.8
        let skyScrollViewOffset = leftDistance + ((offset / maxOffset) * (skyScrollView.contentSize.width - rightDistance - leftDistance))
        skyScrollView.contentOffset = CGPoint(x: skyScrollViewOffset, y: 0)
        backgroundScrollView.contentOffset = CGPoint(x: backgroundScrollViewOffset, y: 0)
    }
    
}

