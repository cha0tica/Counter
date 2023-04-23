//
//  ViewController.swift
//  Counter
//
//  Created by Agata on 23.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var counter = 0 //переменная для счетчика
    
    let dateFormatter: DateFormatter = { //это переменная, которая позволит добыть из Date тольку нужную информацию
          let formatter = DateFormatter()
          formatter.dateStyle = .short //мне нужен короткий формат
          formatter.timeStyle = .short
          return formatter
      }()
    
    var currentDate = Date() //переменная для даты
    
    
    @IBOutlet weak var counterLabel: UILabel! //лейбл для счетчика
    
    @IBOutlet weak var changesLabel: UILabel! //лейбл для итории изменений
    
    @IBAction func tapPlus(_ sender: UIButton) { //кнопка плюс
        counter += 1 //прибавили единичку
        counterLabel.text = ("\(counter)") //обновили вид лейбла с счетчиком
        currentDate = Date() //обновили переменную с датой
        changesLabel.text = ("\(dateFormatter.string(from: currentDate)):\n значение изменено на +1") //вывели историю обновлений
    }
    
    @IBAction func tapMinus(_ sender: UIButton) {
        
        if counter > 0 {
            counter -= 1
            counterLabel.text = ("\(counter)")
            currentDate = Date()
            changesLabel.text = ("\(dateFormatter.string(from: currentDate)):\n значение изменено на -1")
            
        } else {
            currentDate = Date()
            changesLabel.text = ("\(dateFormatter.string(from: currentDate)):\n попытка уменьшить значение счётчика ниже 0")
        }
        
    }
    
    @IBAction func zeroIt(_ sender: UIButton) {
        counter = 0
        counterLabel.text = ("\(counter)")
        currentDate = Date()
        changesLabel.text = ("\(dateFormatter.string(from: currentDate)):\n значение сброшено")
    }
}

