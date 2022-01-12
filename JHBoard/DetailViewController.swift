//
//  DetailViewController.swift
//  JHBoard
//
//  Created by 배주현 on 2022/01/05.
//

import UIKit

class DetailViewController: UIViewController {
    @IBAction func deleteFunction(_ sender: Any) {
        
        let alert = UIAlertController(title: "삭제 확인", message: "삭제하시겠습니까?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "삭제", style: .destructive) { [weak self] (action) in
            DataManager.shared.deleteMemo(self?.memo)
            //deletMemo function을 통해 메모를 삭제함
            
            self?.navigationController?.popViewController(animated: true)
            //navigationController에서 화면을 pop하는 방법
        }
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        //취소 action
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        //알림창을 화면에 표시
    }
    
    var memo: Memo?
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()

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


extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell",for: indexPath)
        
            cell.textLabel?.text = memo?.content
        
            return cell
    
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell",for: indexPath)
        
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
        
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell",for: indexPath)
        
            cell.textLabel?.text = "zico@naver.com"
        
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "lineCell",for: indexPath)
        
            cell.textLabel?.text = "댓글 목록"
        
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "comentCell",for: indexPath)
        
            cell.textLabel?.text = "zico@naver.com"
            cell.detailTextLabel?.text = "반가워용"
        
            return cell
        default:
            fatalError()
        }
    }
    
    
    

}
