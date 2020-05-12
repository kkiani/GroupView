#if !os(macOS)
import UIKit

open class GroupView: UIView {
    @IBOutlet public weak var delegate: UIViewController?
    
    public private(set) var selectedIndex: Int = 0
    public var selectedViewController: UIViewController?{
        guard self.viewControllers.indices.contains(selectedIndex) else {return nil}
        return self.viewControllers[selectedIndex]
    }
    
    public var viewControllers = [UIViewController](){
        didSet{
            if self.viewControllers.count > 0{
                self.present(viewControllerAt: 0)
            }
            
            for viewController in viewControllers{
                delegate?.addChild(viewController)
            }
        }
    }
    
    public func present(viewControllerAt index: Int){
        self.removeAllSubviews()
        
        self.selectedIndex = index
        guard let view = viewControllers[index].view else{
            fatalError("selcet viewController out of index.")
        }
        
        self.addSubview(view)
        view.fills
    }
}
#endif
