

import UIKit

public enum CSLogType: Int {
    case basic
    case title
    case tag
}

public class CSLogButton: UIButton {
    public var logType: CSLogType = .basic
    //스토리보드 방식으로 버튼의 인스턴스를 생성할때 사용되는 초기화 메소드
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = UIColor.white
        
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
    
    @objc func logging(_ sender: UIButton) {
        switch self.logType {
        case .basic:
            NSLog("버튼이 클릭되었습니다.")
        case .title:
            let btnTitle = sender.titleLabel?.text ?? "타이틀 없는"  // ?? nil일 경우 뒤에있는 값 사용
            NSLog("\(btnTitle) 버튼이 클릭되었습니다.")
        case .tag:
            NSLog("\(sender.tag) 버튼이 클릭되었습니다.")
        }
    }
}
