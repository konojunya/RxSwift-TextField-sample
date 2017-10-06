//
//  ViewController.swift
//  rxswift-textfield-sample
//
//  Created by konojunya on 2017/10/06.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var input: UITextField!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.input.rx.text.orEmpty
        .throttle(1.0, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .subscribe(onNext: { [unowned self] text in
            self.label.text = text
        })
        .disposed(by: self.disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

