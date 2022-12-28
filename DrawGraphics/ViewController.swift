import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //선, 삼각형 그리기
    @IBAction func btnDrawLine(_ sender: Any) {
        //콘텍스트를 이미지 뷰의 크기와 같게 생성
        UIGraphicsBeginImageContext(imgView.frame.size)
        
        //생성한 콘텍스트의 정보를 가져온다.
        let context = UIGraphicsGetCurrentContext()!
        
        //직선 시작
        context.setLineWidth(2.0) //선 굵기
        context.setStrokeColor(UIColor.red.cgColor) //선 색상
        
        context.move(to: CGPoint(x: 70, y: 50)) //선의 시작 위치
        context.addLine(to: CGPoint(x: 270, y: 250)) //선의 끝 위치
        
        context.strokePath() //경로대로 그린다.
        
        //삼각형 시작
        context.setLineWidth(4.0) //선 굵기
        context.setStrokeColor(UIColor.blue.cgColor) //선 색상
        
        context.move(to: CGPoint(x: 170, y: 200)) //선 시작 위치
        context.addLine(to: CGPoint(x: 270, y: 350)) //다음 위치
        context.addLine(to: CGPoint(x: 70, y: 350)) //다음 위치
        context.addLine(to: CGPoint(x: 170, y: 200)) //다음 위치
        context.strokePath() //위치를 따라서 선을 그린다.
        
        //지금까지 그린 이미지를 이미지 뷰에 나타낸다.
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext() //그리기 종료
    }
    //사각형 그리기
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(2.0) //선 굵기
        context.setStrokeColor(UIColor.red.cgColor) //선 색
        
        //좌표(70, 100)에서 시작하고 폭 200px, 높이 200px 인 사각형을 그린다.
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    //원 및 타원 그리기
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        // xy 좌표에서 시작하고 폭이 200, 높이가 100인 사각형 안에 내접하는 타원을 그린다.
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))
        context.strokePath()
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        //xy 좌표에서 시작하고 폭 200, 높이 200인 사각형 안에 있는 원을 그린다.
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //호 그리기
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(2))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //채우기 기능
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) //그리기 시작
        let context = UIGraphicsGetCurrentContext()!
        
        //채워진 사각형 그리기
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor) //채우기 설정
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        context.fill(rectangle) //사각형 채우기
        context.strokePath()
        
        //채워진 원 그리기
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle) //타원 채우기
        context.strokePath()
        
        //채워진 삼각형 그리기
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        context.fillPath() //선의 내부를 색상으로 채운다.
        context.strokePath()
        
        //이미지 뷰에 표시 하기
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext() //그리기 끝
    }
    
}

