import UIKit

class ViewController: UIViewController {
    static let identifier = String(describing: ViewController.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    var productArray = [Thing]()
    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var viewSegmentedController:UISegmentedControl!
    @IBOutlet weak var cartButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productArrayConfigure()
        shopTableConfigure()
    }
    @IBAction func showCart(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: CartViewController.identifier) as! CartViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
            {
            case 0:
                hideShopCollectionView()
            case 1:
                hideShopTableView()
            default:
                break
            }
        shopTableView.reloadData()
        shopCollectionView.reloadData()
    }
    
    func shopTableConfigure(){
        shopTableView.backgroundColor = .systemGray6
        shopTableView.delegate = self
        shopTableView.dataSource = self
        shopTableView.register(ShopTableViewCell.nib, forCellReuseIdentifier: ShopTableViewCell.identifider)
    }
    
    
    func hideShopCollectionView() {
        self.shopCollectionView.isHidden = true
        self.shopTableView.isHidden = false
        
    }
    
    func hideShopTableView() {
        self.shopTableView.isHidden = true
        self.shopCollectionView.isHidden = false
    }
    
    func productArrayConfigure() {
        self.productArray.append(Thing(name: "Anna", description: "Hello", price: 01.35 , imageName: "1 ph"))
        self.productArray.append(Thing(name: "Kate", description: "Hi.", price: 02.50, imageName: "2 ph"))
        self.productArray.append(Thing(name: "Peter", description: "Ok", price: 03.15, imageName: "3 ph"))
        self.productArray.append(Thing(name: "Sophia", description: "Bye", price: 04.05, imageName: "4 ph"))
        self.productArray.append(Thing(name: "Miya", description: "Goodbye", price: 05.30, imageName: "5 ph"))
        self.productArray.append(Thing(name: "Jane", description: "Thanks", price: 06.41, imageName: "6 ph"))
        self.productArray.append(Thing(name: "Alice", description: "And you?", price: 07.32, imageName: "7 ph"))
        self.productArray.append(Thing(name: "Jasmine", description: "Where?",price: 08.40, imageName: "8 ph"))
        self.productArray.append(Thing(name: "Mary", description: "When?", price: 09.20, imageName: "9 ph"))
        self.productArray.append(Thing(name: "Emma", description: "Who?", price: 10.36, imageName: "10 ph"))
        }
}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shopTableView.dequeueReusableCell(withIdentifier: ShopTableViewCell.identifider) as! ShopTableViewCell
        cell.configure(self.productArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: ProductViewController.identifider) as! ProductViewController
        vc.item = self.productArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}



