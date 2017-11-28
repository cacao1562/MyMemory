

import UIKit

class SideBarViewController : UITableViewController {
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let profileImage = UIImageView()
    
    let titles = [
    "새글 작성하기", "친구 새글", "달력으로 보기", "공지사항", "통계", "계정 관리" ]
    
    let icons = [
        UIImage(named:"icon01.png"),
        UIImage(named:"icon02.png"),
        UIImage(named:"icon03.png"),
        UIImage(named:"icon04.png"),
        UIImage(named:"icon05.png"),
        UIImage(named:"icon06.png")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        headerView.backgroundColor = UIColor.brown
        
        self.nameLabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        self.nameLabel.text = "꼼꼼한 재은씨"
        self.nameLabel.textColor = UIColor.white
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.nameLabel.backgroundColor = UIColor.clear
        headerView.addSubview(nameLabel)

        self.emailLabel.frame = CGRect(x: 70, y: 30, width: 100, height: 30)
        self.emailLabel.text = "cacao@naver.com"
        self.emailLabel.textColor = UIColor.white
        self.emailLabel.font = UIFont.boldSystemFont(ofSize: 11)
        self.emailLabel.backgroundColor = UIColor.clear
        headerView.addSubview(emailLabel)
        
        let defaultProfile = UIImage(named:"account.jpg")
        self.profileImage.image = defaultProfile
        self.profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        self.profileImage.layer.cornerRadius = (self.profileImage.frame.width / 2)
        self.profileImage.layer.borderWidth = 0  //테두리 두께
        self.profileImage.layer.masksToBounds = true //마스크 효과
        headerView.addSubview(self.profileImage)
 
        self.tableView.tableHeaderView = headerView //헤더영역 /Footer푸터(하단)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "MemoForm")
            let target = self.revealViewController().frontViewController as! UINavigationController
            target.pushViewController(uv!, animated: true)
            self.revealViewController().revealToggle(self)
        } else if indexPath.row == 5 {
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "_Profile")
            self.present(uv!, animated: true) {
                self.revealViewController().revealToggle(self)
            }
        }
        
    }
}
