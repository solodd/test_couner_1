import UIKit

class ViewController: UIViewController {
    var a = 0
    let label = UILabel()
    @objc func tappedButton() {
        a += 1
        label.text = "\(a)"
        func zeroing(){
            a = 0
            label.text = "\(a)"
            let alert = UIAlertController  (title: "Warning", message:   "a > 5", preferredStyle: .alert)
            let okButton = UIAlertAction (title: "OK", style: .default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
        if a > 5 {zeroing()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let btn = UIButton(type: .custom) as UIButton
        btn.backgroundColor = .gray
        btn.setTitle("+1", for: .normal)
        btn.frame = CGRect(x: 75, y: 100, width: 200, height: 100)
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        self.view.addSubview(btn)
    
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 100)
        label.textColor = .black
        label.text = "0"
        self.view.addSubview(label)
    }
    
    
    
    
}

