//
//  EditViewController.swift
//  JHBoard
//
//  Created by 배주현 on 2022/01/05.
//

import UIKit

class EditViewController: UIViewController {
    
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        guard let memo = memoTextView.text,
              memo.count > 0 else {
                  alert(message: "메모를 입력하세요")
                  return
              }
        
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
//        
        
               
        dismiss(animated: true, completion: nil)
        
       
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
