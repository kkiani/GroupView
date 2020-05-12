#if !os(macOS)
import UIKit

class GroupView: UIView {
    @IBOutlet weak var delegate: UIViewController?
    
    private(set) var selectedIndex: Int = 0
    var selectedViewController: UIViewController?{
        guard self.viewControllers.indices.contains(selectedIndex) else {return nil}
        return self.viewControllers[selectedIndex]
    }
    
    var viewControllers = [UIViewController](){
        didSet{
            if self.viewControllers.count > 0{
                self.present(viewControllerAt: 0)
            }
            
            for viewController in viewControllers{
                delegate?.addChild(viewController)
            }
        }
    }
    
    func present(viewControllerAt index: Int){
        self.removeAllSubviews()
        
        self.selectedIndex = index
        guard let view = viewControllers[index].view else{
            fatalError("selcet viewController out of index.")
        }
        
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

        let trailingAnchor = view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let leadingAnchor = view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let topAnchor = view.topAnchor.constraint(equalTo: self.topAnchor)
        let bottomAnchor = view.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        NSLayoutConstraint.activate([trailingAnchor, leadingAnchor, topAnchor, bottomAnchor])
    }
}
#endif
