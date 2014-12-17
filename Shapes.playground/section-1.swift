import UIKit
import XCPlayground

class Shape: UIView {
    var color:UIColor
    init(color:UIColor) {
        self.color = color
        super.init(frame: CGRectNull)
        self.backgroundColor = color
    }
    func getArea() -> Double {
        return 0
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Circle: Shape {
    var radius:Int
    init(radius:Int, color:UIColor) {
        self.radius = radius
        super.init(color: color)
        self.frame.size = CGSize(width: radius * 2, height: radius * 2)
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        return(M_PI * Double(radius * radius))
    }
}

class Rectangle: Shape {
    var width:Int
    var height:Int
    init(width:Int, height:Int, color:UIColor) {
        self.width = width
        self.height = height
        super.init(color: color)
        self.frame.size = CGSize(width: width, height: width)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        return(Double(width * height))
    }
}

class RoundedRectangle: Rectangle {
    var radius:Int
    init(radius:Int, width:Int, height:Int, color:UIColor) {
        self.radius = radius
        super.init(width:width, height:height, color:color)
        self.frame.size = CGSize(width: width, height: height)
        self.layer.cornerRadius = CGFloat(radius)
    }

   
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


var roundedRectangle = RoundedRectangle(radius: 30, width: 100, height:100, color: UIColor.yellowColor())
roundedRectangle.center = CGPoint(x: 250, y: 100)


class Square: Shape {
    var width:Int
    init(width:Int, color:UIColor) {
        self.width = width
        super.init(color: color)
        self.frame.size = CGSize(width: width, height: width)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        return(Double(width * width))
    }
}

var circle = Circle(radius: 50, color: UIColor.blueColor())
circle.center = CGPoint(x: 100, y: 100)
circle.getArea()

var square = Square(width: 100, color: UIColor.redColor())
square.center = CGPoint(x: 200, y: 200)
square.getArea()

var rectangle = Rectangle(width: 200, height:300, color: UIColor.greenColor())
rectangle.center = CGPoint(x: 50, y: 300)


let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
XCPShowView("Shapes!", view)

view.addSubview(circle)
view.addSubview(rectangle)
view.addSubview(square)
view.addSubview(roundedRectangle)