//
//  TabbarController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class TabbarController: UITabBarController {
    var tabBarView: TabbarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}


// MARK: TabBar setter
extension TabbarController {
    func setTabBar(items: [TabbarItem]) {
        guard items.count > 0 else { return }
        
        tabBarView = TabbarView(items: items)
        guard let bar = tabBarView else { return }
        bar.tabBarItems.first?.setSelected(index: selectedIndex)
        
        bar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bar)
        bar.tabBarItems[2].setMoreItem()
        bar.tabBarItems[0].setSelected(index: 0)

        for i in 0 ..< items.count {
            items[i].tag = i
            items[i].addTarget(self, action: #selector(switchTab), for: .primaryActionTriggered)
        }
        
        NSLayoutConstraint.activate([
            bar.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: bar.trailingAnchor, multiplier: 2),
            bar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    @objc func switchTab(button: UIButton) {
        selectedIndex = button.tag
        tabBarView.tabBarItems[0].setSelected(index: button.tag)
        tabBarView.tabBarItems[1].setSelected(index: button.tag)
        tabBarView.tabBarItems[3].setSelected(index: button.tag)
        tabBarView.tabBarItems[4].setSelected(index: button.tag)
    }
}

extension TabbarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MyTransition(viewControllers: tabBarController.viewControllers)
    }
}


//reference: https://stackoverflow.com/questions/44346280/how-to-animate-tab-bar-tab-switch-with-a-crossdissolve-slide-transition
class MyTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let viewControllers: [UIViewController]?
    let transitionDuration: Double = 0.2

    init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(transitionDuration)
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
            else {
                transitionContext.completeTransition(false)
                return
        }

        let frame = transitionContext.initialFrame(for: fromVC)
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart

        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(withDuration: self.transitionDuration, animations: {
                fromView.frame = fromFrameEnd
                toView.frame = frame
            }, completion: {success in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        }
    }

    func getIndex(forViewController vc: UIViewController) -> Int? {
        guard let vcs = self.viewControllers else { return nil }
        for (index, thisVC) in vcs.enumerated() {
            if thisVC == vc { return index }
        }
        return nil
    }
}
