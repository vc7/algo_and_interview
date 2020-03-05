## 20200304 getSmallestParentView


``` swift
func getSmallestParentView(view1: UIView, view2: UIView) -> UIView? {
    var parentViewOf1: UIView? = view1
    var parentViewOf2: UIView? = view2
    
    var seenViews1 = [UIView]()
    var seenViews2 = [UIView]()
    
    var smallestParentView: UIView?
    
    while smallestParentView == nil && (parentViewOf1 != nil || parentViewOf2 != nil) {
        if let view = parentViewOf1 {
            seenViews1.append(view)
        }
        
        if let view = parentViewOf2 {
            seenViews2.append(view)
        }
        
        if let parentView = parentViewOf1, let view = findView(in: seenViews2, view: parentView) {
            smallestParentView = view
        }
        
        if let parentView = parentViewOf2, let view = findView(in: seenViews1, view: parentView) {
            smallestParentView = view
        }
        
        parentViewOf1 = parentViewOf1?.superview
        parentViewOf2 = parentViewOf2?.superview
    }
    
    return smallestParentView
}

func findView(in views: [UIView], view: UIView) -> UIView? {
    if views.isEmpty { return nil }
    return (views.contains(view)) ? view : nil
}
```
