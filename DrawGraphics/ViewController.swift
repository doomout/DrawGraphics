import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //선 그리기
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
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
    }
    
    
    @IBAction func btnDrawCircle(_ sender: UIButton) {
    }
    
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
    }
    
    @IBAction func btnDrawFill(_ sender: UIButton) {
    }
    
}

