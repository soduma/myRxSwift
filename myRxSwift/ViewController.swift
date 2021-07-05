//
//  ViewController.swift
//  myRxSwift
//
//  Created by 장기화 on 2021/06/25.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.combineLatest(textField1.rx.text.orEmpty, textField2.rx.text.orEmpty, textField3.rx.text.orEmpty) { a, b, c -> Int in
            return (Int(a) ?? 0 ) + (Int(b) ?? 0 ) + (Int(c) ?? 0 )
        }
        .map { $0.description }
        .bind(to: resultLabel.rx.text)
        .disposed(by: disposeBag)
    }
}

