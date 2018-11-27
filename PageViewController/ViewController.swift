//
//  ViewController.swift
//  PageViewController
//
//  Created by HigherVisibility on 27/11/2018.
//  Copyright © 2018 ahmedHigherVisibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    let imagelist = ["imag1.jpeg", "photo1.jpeg", "imag1.jpeg", "photo1.jpeg", "imag1.jpeg"]
    var scrollView = UIScrollView()
    
    var pageControl : UIPageControl = UIPageControl(frame:CGRect(x: 50, y: 300, width: 200, height: 50))
    
    var yPosition:CGFloat = 0
    var scrollViewContentSize:CGFloat=0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300))
        
        configurePageControl()
        
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for  i in stride(from: 0, to: imagelist.count, by: 1) {
            var frame = CGRect.zero
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(i)
            frame.origin.y = 0
            frame.size = self.scrollView.frame.size
            self.scrollView.isPagingEnabled = true
            
            let myImage:UIImage = UIImage(named: imagelist[i])!
            let myImageView:UIImageView = UIImageView()
            myImageView.image = myImage
            myImageView.contentMode = UIView.ContentMode.scaleAspectFit
            myImageView.frame = frame
            
            scrollView.addSubview(myImageView)
        }
        
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * CGFloat(imagelist.count), height: self.scrollView.frame.size.height)
        pageControl.addTarget(self, action: Selector(("changePage:")), for: UIControl.Event.valueChanged)
        // Do any additional setup after loading the view.
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = imagelist.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.green
        self.view.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

