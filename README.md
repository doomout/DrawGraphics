# 코어 그래픽 앱

코어 그래픽이란? 아이폰과 아이패드에서 2차원 그래픽을 그릴수 있도록 제공하는 그래픽 라이브러리  

스위프트 문법  

//그림 그리기 시작. 
UIGraphicsBeginImageContext(imgView.frame.size)  
    let context = UIGraphicsGetCurrentContext()!    
        
    context.setLineWidth(2.0) //선 굵기    
    context.setStrokeColor(UIColor.red.cgColor) //선 색상  
        
    // xy 좌표에서 시작하고 폭이 200, 높이가 100인 사각형 안에 내접하는 타원을 그린다.   
    context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))   
    
    //경로를 따라서 그리기   
    context.strokePath()    
    
    //콘텍스트에 그려진 이미지를 이미지 뷰에 나타낸다.   
    imgView.image = UIGraphicsGetImageFromCurrentImageContext()     

//그림 그리기 종료     
UIGraphicsEndImageContext()     
